# `z13-fedora` — Custom Fedora Atomic for the ASUS ROG Flow Z13 (2022, **GZ301ZC**)

A personal, hybrid-GPU, Android-capable KDE workstation on Fedora Atomic, built with BlueBuild,
installed from a self-produced offline ISO onto the **whole** internal SSD (no Windows), with the
**kernel isolated on its own partition**, and upgradeable atomically forever after.

**Target hardware: GZ301ZC** — i7-12700H (6P+8E) + **RTX 3050 Laptop 4 GB (GA107, Ampere)** + Iris Xe,
**MUX + Optimus**, 13.4" FHD+ 1920×1200 120 Hz touch + ASUS Pen (MPP 2.0), 512 GB M.2 2230 NVMe,
16 GB LPDDR5 soldered, Wi-Fi 6E + BT 5.2, ELAN fingerprint reader, 56 Wh / 100 W USB-C PD,
detachable 1-zone-RGB folio keyboard, ROG XG Mobile port. Latest ASUS BIOS for this model: **v322 (2025-05-15)**.

---

## 0. Decisions (as agreed)

| Axis | Decision | Rationale |
|---|---|---|
| Base image | `ghcr.io/ublue-os/kinoite-main:44` (KDE **Plasma 6.7.x** per the Fedora package page — confirm with `plasmashell --version`; the OSK/tablet notes in §7.2 assume 6.7 behaviour, kernel 7.2.x) | KDE first per your call; Kinoite is what the dGPU-Waydroid stack is tested against. |
| Boot model | **Single boot, whole 512 GB disk, no Windows.** Layout isolates the kernel (§5) | Your call. Reversible later via firmware-level **ASUS Cloud Recovery** (§6.1). |
| Kernel isolation | **Separate `/boot` (2 GiB, ext4)** holding kernel + initramfs + GRUB/BLS entries, plus ESP; root carries only the OS payload. Phase-2 option: sealed **systemd-boot + UKI** layout (§5.3) | Fedora Atomic is GRUB2 + BLS + bootupd with `/boot` split from root, and **LUKS forces the split anyway** because GRUB cannot read an encrypted `/boot`. |
| Encryption | **LUKS2 on root** ("Encrypt my data" in Anaconda; `/boot` and ESP stay plaintext), TPM2 auto-unlock enrolled post-install | Laptop that travels. TPM2 binding documented via `systemd-cryptenroll --tpm2-pcrs=7:sha256`. |
| Secure Boot | **OFF for v1** | Debugging freedom. kmods are pre-signed by uBlue, so re-enabling later = `mokutil --import …/akmods-ublue.der` (password `universalblue`). The generated ISO already auto-enrols that same key (BCI's default `--secure-boot-url`/`--enrollment-password`) - leave those defaults alone; pointing them at our cosign key would stop the uBlue-signed NVIDIA/asus modules from loading. |
| Power stack | **`tuned`/`tuned-ppd`** (Fedora 44's default PPD provider) — **not** `power-profiles-daemon`; no TLP; `asusd` configured not to double-write `platform_profile` | F44 ships tuned-ppd by default; shipping PPD alongside it is a documented conflict, and two writers degrade `platform_profile` to `custom`. |
| ASUS userspace | COPR `lukenukem/asus-linux` → **`asusctl` only** | No `supergfxctl` (deprecated **and broken for MUX on ≥ 6.19 kernels**), no `rog-control-center` (known crash on GZ301ZC), no fan curves (Ryzen-only). |
| NVIDIA | BlueBuild `akmods` module: `base: main`, `nvidia-driver: nvidia-open` | GA107 supported; open KM is **mandatory** for the dGPU-Waydroid stack (DMA-BUF). |
| Android (Track A, default) | Fedora `waydroid` 1.6.3 + **Android 16 QPR2 GAPPS** (WayDroid-ATV `20260717`), rendering on the **Iris Xe** iGPU | Binder is in-kernel; iGPU is Waydroid's best-supported path. |
| Android (Track B, experimental) | `waydroid-nvidia` v0.1.2 (Vulkan/Venus proxy) — **only viable with the MUX in dGPU mode**, which now has no Windows fallback (§4.3) | Requested; feasibility spike first, shipped as a separate image variant. |
| Office | Flathub `org.onlyoffice.desktopeditors` **9.4.0**, deployed on first boot | Official Flatpak; no second RPM repo in the image. |
| Installer | `bluebuild generate-iso` (BCI, **offline** OCI payload) → Fedora Media Writer/dd to a **16 GB** USB | ISO ≈ 5.9 GiB > the 4 GiB FAT32 limit, so raw device write only. |

**Not promised:** pen input inside Android apps (waydroid#423); Play Integrity DEVICE/STRONG (banking/DRM
apps refuse); the 8 MP rear camera; Intel-ROG fan curves; hibernation.

---

## 1. Hardware × driver matrix

Kernel options verified in the **Fedora 44 kernel config** (`CONFIG_VMD=m`, `CONFIG_ANDROID_BINDER_IPC=y`, `CONFIG_HID_ASUS=m`, `I2C_HID_ACPI=m`, `HID_MULTITOUCH=m`, `CONFIG_DRM_NOVA` **unset**, `CONFIG_ZRAM=m`).

| Subsystem | Facts | Userspace | Verification |
|---|---|---|---|
| Touchscreen | I²C-HID panel; drivers in-tree. Vendor still unidentified for 2022 SKUs | libinput/KWin | `libinput list-devices` |
| Stylus | ASUS Pen SA201H, **MPP 2.0**, 4096 pressure + tilt; shows up as a libinput tablet tool | Plasma **Drawing Tablet KCM** (pressure curve, area mapping, button remap, calibration since 6.3); `KWIN_WAYLAND_EMULATE_TABLET=1` for apps without tablet support | draw in Xournal++/Rnote; check KCM sees the pen |
| Folio keyboard | USB HID `0b05:1a30`, mainline quirk `USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO` → touchpad handled by `hid-multitouch` | — | keys + touchpad + hot-reattach |
| Tablet mode | Hinge sensor (`HID_SENSOR_CUSTOM_INTEL_HINGE=m`); Plasma Touch Mode is triggered **only** by libinput's tablet-mode switch | Plasma Touch Mode = "Automatically enable as needed" | `libinput debug-events` shows `SW_TABLET_MODE`; detach the folio and watch Touch Mode |
| Fingerprint | ELAN `04f3:0c6e` (in libfprint's *development* list) | `fprintd` + `libfprint` | `lsusb`; `fprintd-enroll` |
| MUX / GPU modes | Kernel exposes `/sys/devices/platform/asus-nb-wmi/gpu_mux_mode` (0 = dGPU-only, 1 = hybrid) **but it is deprecated**; Linux 6.19+ replaces it with **`asus-armoury`** (`/sys/class/fw_attributes/*`), which also carries `ppt_pl1_spl` / `ppt_pl2_sppt` | `asusctl` for profiles; MUX via armoury attribute (§4.3) | `ls /sys/class/fw_attributes/`, `cat /sys/firmware/acpi/platform_profile` |
| Power | `platform_profile` written by **both** `asusd` and tuned-ppd → second writer degrades it to `custom` | `asusctl` + `tuned-ppd`, with `change_platform_profile_on_{ac,battery}=false` and `platform_profile_linked_epp=false` in `/etc/asusd/asusd.ron` | `cat /sys/firmware/acpi/platform_profile`, `powerprofilesctl`/`tuned-adm` |
| dGPU | RTX 3050 (GA107); nouveau blacklisted; NOVA not enabled in F44 | uBlue/negativo17 nvidia-open userspace | `nvidia-smi`; driver ≥ 595.71 for Track B |
| iGPU | Iris Xe; feeds Waydroid Track A | `libva-intel-media-driver`, `mesa-vulkan-drivers` | `vainfo` |
| GPU/compositor | **Plasma 6.7's Vulkan path can put `kwin_wayland` on the dGPU** (battery/heat regression, KDE bug 521914) | env guard: `KWIN_DISABLE_VULKAN=1` (verify on hardware); `KWIN_DRM_DEVICES` to pin the primary GPU | `nvidia-smi pmon` while idle on the desktop |
| Audio | Realtek **ALC285** (`1043:1c42`), no mainline quirk; legacy HDA expected, not SOF | `alsa-ucm-conf` | speakers/mic test |
| Wi-Fi/BT | Wi-Fi 6E + BT 5.2; **chip unidentified** for 2022 SKUs (`iwlwifi`/`mt7922` both in-tree) | `linux-firmware` | `lspci -nnk` |
| Suspend | s2idle; owner reports of suspend/hibernation trouble on this generation | — | 5× suspend/resume cycle |
| Swap | **No disk swap**; zram-generator default `zram-size = min(ram, 8192)` → 8 GiB zram on 16 GB | `zram-generator` | `zramctl` |
| Battery | 56 Wh; ~6 h light use measured on this class | — | `upower -i` |

---

## 2. Repository layout (as built — M0)

```
z13-fedora/                          # git repo, initial commit 731d97c (18 files)
├── recipes/
│   ├── recipe.yml                   # entry point: base, module order, signing
│   ├── system.yml                   # files → image root overlay
│   ├── asus.yml                     # COPR lukenukem/asus-linux → asusctl
│   ├── nvidia.yml                   # akmods: base main, nvidia-driver nvidia-open
│   ├── waydroid.yml                 # waydroid + waydroid-selinux (Track A)
│   ├── desktop.yml                  # Plasma OSK, fonts, tuned-ppd, systemd units
│   ├── apps.yml                     # system Flatpaks (ONLYOFFICE, ink apps)
│   ├── branding.yml                 # os-release — runs after all package modules
│   ├── recipe-dgpu.yml              # Track B: created at M4B, after the MUX spike
│   └── waydroid-dgpu.yml            # Track B: patched Waydroid + waydroid-nvidia
├── files/system/                    # mirrored into the image root
│   ├── etc/xdg/plasma-workspace/env/z13-guards.sh
│   ├── usr/libexec/z13/
│   │   ├── verify.sh                # acceptance checklist      (ujust z13-verify)
│   │   ├── gpu-status.sh            # which GPU does what        (ujust z13-gpu)
│   │   ├── waydroid-setup.sh        # Android 16 GAPPS bootstrap (ujust z13-waydroid-setup)
│   │   ├── oobe.sh                  # post-install setup         (ujust z13-oobe)
│   │   ├── mux-spike.sh             # MUX / asus-armoury probe   (ujust z13-mux)
│   │   ├── recovery-install.sh      # on-disk recovery env       (ujust z13-recovery-install)
│   │   └── report.sh                # paste-ready evidence block (ujust z13-report)
│   └── usr/share/ublue-os/just/99-z13.just
├── .github/workflows/
│   ├── build.yml                    # image build: daily cron + push + PR, recipe matrix
│   └── iso.yml                      # offline installer ISO built from the published image
└── PLAN.md
```

Every `ujust` recipe is a thin wrapper that `exec`s a script in `/usr/libexec/z13/`, so the logic can be
read, run and tested directly instead of hiding inside a Justfile body.

---

## 3. Recipes (the files in `recipes/` are the source of truth)

`recipes/recipe.yml` composes the module files in this order:

| # | File | What it does |
|---|---|---|
| 1 | `system.yml` | `files` module: overlays `files/system/**` into the image root |
| 2 | `asus.yml` | COPR `lukenukem/asus-linux` -> `asusctl` |
| 3 | `nvidia.yml` | `akmods`: `base: main`, `install: []`, `nvidia-driver: nvidia-open` |
| 4 | `waydroid.yml` | `waydroid` + `waydroid-selinux` from Fedora |
| 5 | `desktop.yml` | `plasma-keyboard`/`maliit-keyboard`, metric-compatible fonts, `tuned-ppd`; enables `tuned-ppd.service` + `asusd.service`, keeps `waydroid-container.service` off |
| 6 | `apps.yml` | `default-flatpaks`: ONLYOFFICE 9.4.0 + Rnote + Xournal++ + Loupe (system scope) |
| 7 | `branding.yml` | `os-release` identity - deliberately last, because changing `ID` early breaks COPR/repo identification |
| 8 | - | `signing` (cosign policy) |

Two ordering constraints to remember when editing:

- `akmods` requires an `install:` key even when it is empty (`install: []`); `nvidia-driver:` alone
  fails schema validation.
- `os-release` changes `ID`; every `dnf`/COPR module runs before it, so branding stays at the end.

## 4. Layer rationale (deltas from the previous revision)

### 4.1 ASUS: MUX and power, corrected for kernel 7.2

- `supergfxctl` is **not** shipped: asus-armoury (merged for Linux 6.19) deprecates the old
  `/sys/devices/platform/asus-nb-wmi/*` attributes, supergfxctl 5.2.7 still reads the old paths, and
  forcing `AsusMuxDgpu` on ≥ 6.19 breaks `supergfxd`. **`cardwire` does not do MUX at all** — it is an
  eBPF-LSM tool that blocks/unblocks the dGPU (Integrated/Hybrid/Manual).
- The MUX is therefore driven by writing the **asus-armoury attribute** (expected under
  `/sys/class/fw_attributes/`) — an M4B-0 spike item, since the exact path could not be verified from
  documentation alone. `gpu_mux_mode` (legacy sysfs) remains a fallback.
- Power: `asusd` and the PPD provider both write `platform_profile` and EPP. Following asusctl's MANUAL,
  the image ships `/etc/asusd/asusd.ron` with `change_platform_profile_on_ac: false`,
  `change_platform_profile_on_battery: false`, `platform_profile_linked_epp: false`, leaving tuned-ppd in
  charge. TLP is not installed (documented conflict with PPD providers). `thermald` is optional.

### 4.2 NVIDIA — unchanged verdict

`akmods` → `nvidia-open` for the stock `main` kernel; kargs written by the module; no `NVreg_*` tuning on
Ampere; MOK enrolment only if Secure Boot is re-enabled. For Track B the driver must read **≥ 595.71**.

### 4.3 Android, two tracks — with the Windows-free MUX consequence

Track A (default) is unchanged: Fedora `waydroid` + Android 16 QPR2 GAPPS from WayDroid-ATV, iGPU
rendering, Play-Protect certification, ARM translation via `waydroid_script`.

**Verified live (2026-09-17)** — the manifests `ujust z13-waydroid-setup` resolves, taken from upstream's own
URL construction (`tools/actions/initializer.py`):

| What | URL shape | Newest image found |
|---|---|---|
| system | `<channel>/<rom>/waydroid_<arch>/<type>.json` -> `.../a16-qpr2/system/lineage/waydroid_x86_64/GAPPS.json` | `lineage-23.2-20260717-GAPPS-waydroid_x86_64-system.zip` (1336 MiB) |
| vendor | `<channel>/waydroid_<arch>/<vendor>.json` -> `.../a16-qpr2/vendor/waydroid_x86_64/MAINLINE.json` | `lineage-23.2-20260717-MAINLINE-waydroid_x86_64-vendor.zip` (201 MiB) |

Two details that look like bugs in a browser but are not: the `-c`/`-v` values are **channel prefixes** (the
bare URLs 404 by design), and the **vendor** URL carries **no rom segment** while the system URL does. The
setup script preflights both manifests and prints the exact image names and sizes before pulling ~1.5 GB; if a
channel ever disappears it stops before downloading and offers `--stock` (official Android 13) or a manual
image drop into `/etc/waydroid-extra/images/`.

Track B (dGPU) now has **one hard prerequisite that can no longer be satisfied from Windows**: the
compositor must run on NVIDIA, which on this chassis requires **MUX → dGPU-only mode**. Options, in order:

1. Write the asus-armoury MUX attribute from Linux (spike; expected to work on kernel 7.2, path unverified).
2. Legacy `/sys/devices/platform/asus-nb-wmi/gpu_mux_mode` if still present on this kernel.
3. Temporary Windows on an **external USB SSD** solely to flip the MUX once (the setting lives in the EC and
   persists) — ugly, only if (1)/(2) fail and you still want Track B.

If none work, Track B is parked and documented as blocked; Track A remains fully functional. All the other
Track B mechanics (patched Waydroid, venus proxy, `run-probe.sh`, MUX-dGPU mode, rollback via a second
deployment) are unchanged from the previous revision.

### 4.4 ONLYOFFICE and fonts

Flathub `org.onlyoffice.desktopeditors` **9.4.0** as a system Flatpak. With Windows gone there are no
Microsoft fonts on the machine, so the image ships the metric-compatible set (`google-carlito-fonts`,
`google-crosextra-caladea-fonts`, `google-arimo-fonts`, `liberation-sans-fonts`, `liberation-serif-fonts`) and associates
`.docx/.xlsx/.pptx` with ONLYOFFICE — this is the single biggest out-of-box fidelity win for documents.

### 4.5 Waydroid desktop integration (new)

Fedora's `waydroid` 1.6.3 ships a **"Waydroid" submenu** in the app menu (`X-WayDroid-App` category,
`/etc/xdg/menus/applications-merged/waydroid.menu`) with stop/re-initialise actions; per-app launchers
appear in `~/.local/share/applications/*waydroid*`; 1.6.0+ forwards Android notifications (image
dependent) and hides system apps. Clipboard sync is flaky (upstream issues 2341/892/1131) and file
exchange is via a shared folder, not drag-and-drop — document this rather than promise it.

---

## 5. Disk layout — isolating the kernel

### 5.1 What Fedora Atomic gives you (verified)

- Fedora Atomic is **GRUB2 + BLS entries with a static, bootupd-managed config** (F41 change, F42 auto-migration).
- **`/boot` was raised from 1 GiB to 2 GiB in Fedora 43 across all Anaconda configurations**, including Atomic.
- The kernel + initramfs live in `/boot`; the OS payload lives in the root filesystem, which on F42+ is
  **composefs-backed** (the ostree repo stays at `/sysroot/ostree`, `/` itself is tiny and reads ~100 % full).
- **`/etc` can never be a separate partition** (3-way merged machine state), **`/home` is a symlink to
  `/var/home`** on Atomic, and there is exactly one `/var`.
- Anaconda on Atomic accepts manual mounts only for `/`, `/boot`, `/boot/efi`, `/var` and subpaths of
  `/var` — and it will *not* validate a bad layout. Fedora's own docs still call Atomic manual
  partitioning "not fully functional" (tracker #110) and recommend automatic partitioning.
- **LUKS forces a separate `/boot`**: GRUB cannot read an encrypted `/boot`, so bootc's guidance is to do
  LUKS independently (Anaconda `--encrypted` + `systemd-cryptenroll` post-install) with `/boot` and the
  ESP left plaintext.

### 5.2 v1 layout (single boot, 512 GB) — recommended

| # | Mount | Size | FS | Label | Why |
|---|---|---|---|---|---|
| 1 | `/boot/efi` (ESP) | **1 GiB** (2 GiB if you plan §5.3) | vfat | - | bootloader lives here alone; Fedora warns below 500 MiB |
| 2 | `/boot` | **2 GiB** | ext4 | - | **kernel isolation**: kernel + initramfs + BLS entries, outside the OS payload; mandatory once LUKS is on |
| 3 | `/` | **100 GiB** | btrfs (LUKS2) | - | holds `/sysroot/ostree` plus the composefs images of two deployments |
| 4 | `/var` | **~360 GiB** | xfs (LUKS2) | - | `/var/home`, containers, VMs, Waydroid images - survives a reinstall |
| 5 | `/mnt/recovery` | **10 GiB** | ext4 | `RECOVERY` | the on-disk recovery environment (§5.5); **deliberately unencrypted** |

Notes:
- If you prefer one filesystem, let `/var` stay a btrfs subvolume/bind of root — but then a reinstall
  destroys your data, and you lose the blast-radius isolation that a separate partition gives.
- **No swap partition.** Fedora's zram-generator gives 8 GiB zram on 16 GB RAM; hibernation would need a
  swap ≥ RAM plus resume configuration and is out of scope (suspend is already a risk item).
- Anaconda's *automatic* partitioning produces a working three-partition layout (ESP + 2 GiB `/boot` +
  btrfs root). The five-partition layout above — specifically the separate `/var` and the `RECOVERY`
  partition — **requires manual partitioning**, and the installer will not validate it. That is the price of
  both the reinstall-survives archiving and the on-disk recovery environment; `ujust z13-verify` (§5.4)
  checks afterwards that the layout actually came out right.

### 5.3 Phase 2 — kernel as a single signed artifact (sealed/UKI layout)

Fedora's Atomic maintainers shipped **sealed bootable-container images** (test images, announced 2026-04-28):
`systemd-boot` as bootloader + a **Unified Kernel Image** (kernel + initrd + command line in one `.efi`)
in the ESP + composefs root with **fs-verity**, everything signed for Secure Boot.

| | v1 classic (this plan) | Phase 2 sealed |
|---|---|---|
| Partitions | ESP + `/boot` + `/` (+`/var`) | **ESP (2 GiB) + encrypted btrfs root**; no `/boot` |
| Kernel artifact | `vmlinuz` + `initramfs` in `/boot`, GRUB/BLS | one UKI per deployment in the ESP (`/boot/EFI/Linux/<kver>.efi`) |
| Verified boot | no (GRUB static config) | yes (systemd-boot + UKI both signed), requires Secure Boot **on** |
| TPM2 unlock | possible but weaker (PCR 7 alone) | "reasonably secure by default" thanks to the verified chain |
| Status | supported, what Anaconda/BCI installs today | **test images only**; no installer ISO (install via `bootc install to-filesystem --bootloader=systemd --composefs-backend` from a live environment); blueprint partitioning customizations disabled |
| Initramfs | generic | per-vendor trimmed (`-intel`, `-nvidia`, …) to keep UKI size (and therefore boot time) sane |

Recommendation: **do not adopt in v1** (it would fork the whole build pipeline and needs Secure Boot on,
which we deliberately keep off while debugging). Do size the ESP at **2 GiB** if you want that migration to
be a re-install rather than a repartition. Note that Fedora has explicitly said the classic split
kernel+initramfs layout is not going away.

### 5.4 Verify the layout after install

```bash
lsblk -f                       # expect esp vfat + /boot ext4 + / btrfs/xfs + /var
findmnt /boot /boot/efi /var   # each a separate device
bootc status; rpm-ostree status
sudo ostree admin status       # deployments kept: max 2 bootable
sudo ostree admin pin 0        # pin a known-good deployment before risky experiments
```

Deployment retention is **2 bootable deployments**; extra space per deployment is roughly the size of the
image (`rpm-ostree cleanup --rollback` prunes; `ostree admin pin` protects).

---

### 5.5 Recovery: what happens when it will not boot

Four tiers, in the order to reach for them. The first two cost nothing and come from Fedora itself;
tiers 3 and 4 are what this project adds.

**T0 - boot the previous deployment (built in).** rpm-ostree/bootc keeps **two bootable deployments**;
the GRUB menu lists them as `Fedora Linux ... (ostree:0|1)`. Protect a known-good one before risky work:

```bash
sudo ostree admin pin 0                  # protect the booted deployment from pruning
sudo rpm-ostree rollback                 # or: bootc rollback
sudo rpm-ostree cleanup --rollback       # prunes only unpinned old deployments
```

The caveat that bites people: on Atomic the GRUB menu is hidden by default, so "just pick the previous
deployment" is not reachable until a timeout is set. `/boot/grub2/user.cfg` is sourced by bootupd's static
config, so `set timeout=5` there is the supported way - `z13-recovery-install` writes it, and
`ujust z13-verify` checks it.

**T1 - repair in place.** In the GRUB menu press `e` on a deployment entry and append one of
`init=/bin/bash` (Fedora's documented root-shell recipe), `rd.break`, or `systemd.unit=emergency.target`.
Covers a broken userspace or config while `/boot` is intact.

**T2 - the on-disk recovery environment (this project).** A 10 GiB ext4 partition labelled `RECOVERY`,
mounted at `/mnt/recovery`, holding an **extracted copy of the installer ISO**. Menu entries are written to
**`/boot/grub2/custom.cfg`** - the hook bootupd's static configuration actually sources (`41_custom.cfg` ->
`$config_directory/custom.cfg`) - so they survive deployments without touching the generated `grub.cfg`:

```text
menuentry 'Z13 Fedora recovery (install / repair)' {
    insmod part_gpt; insmod ext2
    search --no-floppy --set=root --label RECOVERY
    linux /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=RECOVERY <iso options>
    initrd /images/pxeboot/initrd.img
}
menuentry 'Z13 Fedora recovery (rescue shell)' { ...same, plus: inst.rescue }
```

Why the *extracted tree* rather than a loop-mounted ISO file: `inst.stage2=hd:LABEL=RECOVERY` makes
Anaconda mount that filesystem at `/run/install/repo`, find its runtime image through `.treeinfo`
(`stage2 mainimage = images/install.img`), and - because the installer's kickstart uses
`ostreecontainer --url=/run/install/repo/<image_name>` - the **embedded OCI payload resolves as well**, so a
full **offline reinstall** works from the internal disk, with no USB stick and no network.

Manage it with `ujust z13-recovery-install --latest` (fetches the newest release ISO), `--status`, `--remove`.

> **Do not** add entries via `/etc/grub.d/*` + `grub2-mkconfig`. On Fedora 41+ Atomic the GRUB config is
> static and owned by bootupd, `/etc/default/grub` no longer exists, ostree stops generating GRUB configs
> once `bootupd-state.json` carries a `static-configs` key, and `grub2-mkconfig` would overwrite that
> config - Fedora maintainers call this unsupported. `z13-recovery-install` refuses to do it.

**T3 - a second, independent OS instance (documented, not built).** The only fully independent recovery is
another OS with its **own ESP and `/boot`** (a shared ESP risks bootc/bootupd wiping the wrong one):
`ostree admin stateroot-init rescue` plus
`bootc install to-filesystem --stateroot=rescue ...` onto its own partition. Cost: another 10-20 GiB and
permanent boot-menu complexity. The zero-cost equivalent is the CI-built ISO on a USB stick.

---

## 6. Installation runbook (Linux-only, whole disk)

### 6.1 Before you wipe (30–60 minutes, do not skip)

| Step | Action | Why |
|---|---|---|
| 1 | Save the Windows key: `strings /sys/firmware/acpi/tables/MSDM` from any Linux live USB | The OEM licence lives in firmware; no key needed for a future Windows install, but record it anyway |
| 2 | Confirm **ASUS Cloud Recovery** works: F2 at power → F7 (Advanced) → ASUS Cloud Recovery | It is a **firmware** feature, not a disk partition, so wiping is reversible and it works even after an SSD swap |
| 3 | Update **BIOS/EC to v322** before wiping | ASUS ships Windows packages for this model; the `.CAP` inside can also be flashed with **EZ Flash** from a FAT32 USB, but doing it now is the least-friction moment |
| 4 | Download the ASUS driver/BIOS archive for GZ301ZC to external storage | After the wipe, ASUS support pages are the only source; keep them offline |
| 5 | Build & verify the ISO, write it to a **16 GB** USB with Fedora Media Writer (or `dd`) | The BlueBuild ISO is ≈ 5.9 GiB — **above the 4 GiB FAT32 file limit**, so raw device write is the only correct method |
| 6 | Keep a Fedora live USB (stock Kinoite or Workstation) in your bag | Rescue, `wipefs`/`sgdisk` if the installer sees leftovers, and `efibootmgr` surgery |

### 6.2 Firmware settings (F2 at power; F7 = Advanced; F10 = save; Esc or F8 = boot menu)

| Setting | Value | Note |
|---|---|---|
| Fast Boot | **Disabled** | Boot → Fast Boot |
| Secure Boot | **Disabled** (v1) | Security → Secure Boot → Secure Boot Control |
| **VMD/RST** | **Disabled** (Advanced → VMD setup menu) | Documented cause of "no disk found" at install; no RAID use on this machine |
| Boot order | USB first for the install, internal NVMe afterwards | Esc-held-at-power or F8 in the UEFI UI |

### 6.3 Anaconda (the BCI ISO is an **offline** installer)

The ISO embeds your image as an OCI layout and pre-seeds the payload
(`ostreecontainer --url=/run/install/repo/<image> --transport=oci`), so **Installation Source is already
set** and no network is needed to install.

| Screen | What to choose |
|---|---|
| Language / keyboard / time | your locale (KDE variant of the ISO asks for the **user account during installation**, not at first boot) |
| Installation Destination | the single NVMe → *Automatic* for a first install, or *Manual* for the §5.2 layout |

**Manual partitioning recipe** (Installation Destination → Custom / Manual). Five partitions on the NVMe:

| Partition | Mount | Size | Format | Label | Encrypt |
|---|---|---|---|---|---|
| p1 | `/boot/efi` | 1 GiB | EFI System Partition (vfat) | - | no |
| p2 | `/boot` | 2 GiB | ext4 | - | **no** (GRUB cannot read LUKS) |
| p3 | `/` | 100 GiB | btrfs | - | yes (LUKS2) |
| p4 | `/var` | everything left, minus 10 GiB | xfs | - | yes (LUKS2) |
| p5 | `/var/mnt/recovery` | 10 GiB | ext4 | `RECOVERY` | **no** |

Two constraints drive that table:

* `/var/mnt/recovery` is the only on-disk mount point Anaconda accepts for a non-root partition on Atomic
  (the allowed set is `/`, `/boot`, `/boot/efi`, `/var` and sub-paths of `/var`). At runtime it shows up as
  `/mnt/recovery` — `/mnt` is a symlink to `/var/mnt`.
* The recovery partition must stay **outside LUKS**: Fedora's LUKS2 uses argon2id, which GRUB cannot unlock,
  so an encrypted recovery tree simply would not be reachable from the boot menu. If the installer's
  global encryption switch insists on covering every partition, either turn encryption off for that one
  partition or leave p5 unformatted in Anaconda and prepare it afterwards:

```bash
sudo mkfs.ext4 -L RECOVERY /dev/nvme0n1p5     # once, from the installed system
```
| Reclaim space | **Delete all** (this is where the old Windows/recovery partitions die) or `wipefs`/`sgdisk -Z` from a live USB first |
| Encryption | **Encrypt my data** → LUKS2 passphrase. `/boot` stays plaintext by design |
| Root password | set one (or leave root locked and use `sudo` from your user) |
| User creation | create your account here (Kinoite variant) |
| Software selection | leave as-is |

> The installer will not validate Atomic-incompatible manual layouts — if you go manual, use exactly the
> mount set from §5.2.

### 6.4 First boot (see §7 for the checklist)

Post-install, the ISO's `%post` runs
`bootc switch --mutate-in-place --transport registry ghcr.io/<owner>/z13-fedora:<tag>`, so **future updates
come from your registry**, not from the ISO. Then: Plasma Welcome → `ujust z13-oobe` → verify.

### 6.5 Updates, rollback, reinstall

```bash
bootc update && systemctl reboot        # or ujust update
sudo bootc rollback                     # or pick the previous entry in the boot menu
sudo ostree admin pin 0                 # before experiments
```

**Reinstall / repair later:** keep the `/var` partition and **do not reformat it**; Anaconda's automatic
reclaim path destroys it, so choose manual partitioning and mount the existing `/var` in place. `bootc`
offers `bootc install to-existing-root` (reinitializes `/boot` and the ESP, leaves the rest of root,
including `/var`, intact) and the newer `system-reinstall-bootc` wrapper — both expect a live environment,
not the installer ISO.

Firmware updates after the wipe: ASUS publishes a Windows-only BIOS package for this model, but the `.CAP`
flashes via **EZ Flash** from a FAT32 USB; `fwupdmgr` coverage for GZ301ZC is unverified — check
`fwupdmgr get-devices` once installed.

---

## 7. Out-of-box experience (Track A)

### 7.1 What must work within the first 30 minutes

| # | Check | Command / action |
|---|---|---|
| 1 | Plasma 6.7 session on Wayland, panel at 1920×1200 @ 120 Hz | System Settings → Display; `kscreen-doctor -o` |
| 2 | Touch + pen pressure | `libinput debug-events`; draw in Xournal++ |
| 3 | Folio keyboard + touchpad, hot-reattach | detach/attach; Touch Mode flips (`SW_TABLET_MODE`) |
| 4 | Audio out/in | `aplay -l`, PipeWire device test |
| 5 | Wi-Fi/BT, fingerprint | `fprintd-enroll` |
| 6 | Platform profiles + battery limit | `asusctl profile -P`, `asusctl battery`, `cat /sys/firmware/acpi/platform_profile` |
| 7 | dGPU present, iGPU accelerates | `nvidia-smi`; `vainfo` |
| 8 | kwin is **not** idling on the dGPU (§4.1 guard) | `nvidia-smi pmon` at idle; if it is, keep `KWIN_DISABLE_VULKAN=1` |
| 9 | ONLYOFFICE installed and associated | open a `.docx` from Files |
| 10 | Android apps in the menu, Play Store working | `ujust z13-waydroid-setup`; then `waydroid status` |

### 7.2 Baked-in defaults (what the image ships so you do not have to fiddle)

- **Fonts**: Carlito/Caladea/Arimo/Liberation (metric-compatible with Calibri/Cambria/Arial) — documents
  from Windows users render with correct metrics.
- **File associations**: `.docx/.xlsx/.pptx` → ONLYOFFICE.
- **Power**: `tuned-ppd` + `asusd` configured to not fight over `platform_profile`; no TLP.
- **Compositor guards**: `/etc/xdg/plasma-workspace/env/z13-guards.sh` (starts with `KWIN_DISABLE_VULKAN=1`
  pending §7.1-8 verification; `KWIN_DRM_DEVICES` pinning documented).
- **OSK**: `plasma-keyboard` (Plasma 6.6+ OSK) with `maliit-keyboard` as fallback — note the open 6.7
  regression where the virtual keyboard can stick to "always show" (KDE bug 522675); the guard file can
  set `KWIN_IM_SHOW_ALWAYS=1` deliberately if you'd rather have it always on in tablet mode.
- **Waydroid**: submenu with per-app launchers, `persist.waydroid.multi_windows true`, notification
  forwarding (image dependent), shared-folder file exchange documented (no DnD).
- **Recovery tooling**: `ujust z13-verify` (the §7.1 checklist as a script), `ujust z13-report`
  (everything acceptance needs in one paste-ready block), `ujust z13-recovery-install`, documented
  boot-menu rollback.

### 7.3 Needs the network on first boot

The `default-flatpaks` mechanism deploys system Flatpaks (ONLYOFFICE, Rnote, Xournal++) on **first boot**,
so the machine needs internet once. Verified in the module source: v1 ships a `system-flatpak-setup` service
+ timer, v2 ships post-boot Nushell units under `post-boot/` — either way nothing is fetched by Flatpak
during the image build, which is why the build has no Flathub dependency. Expect the apps to appear a few
minutes after the first boot completes, not instantly. Everything else — the OS, NVIDIA, asusctl, Waydroid packages, fonts —
is already in the image.

---

## 8. Risk register (updated)

| # | Risk | Evidence | Mitigation |
|---|---|---|---|
| R1 | **MUX cannot be switched from Linux** (no Windows fallback) | asus-armoury deprecates the old attribute on ≥ 6.19; supergfxctl 5.2.7 broken there; cardwire has no MUX; exact armoury path unverified | M4B-0 spike: enumerate `/sys/class/fw_attributes/`; park Track B if it fails; last resort = one-time Windows USB to flip the EC setting |
| R2 | **Suspend/hibernation unreliable** on this generation | owner reports; s0ix quirks on sibling models | test 5+ s2idle cycles; no hibernation; no `mem_sleep_default` hacks |
| R3 | **Atomic manual partitioning is "not fully functional"** and unvalidated | Fedora Atomic docs, tracker #110 | prefer automatic partitioning; if manual, use exactly §5.2 and verify with §5.4 |
| R4 | **Firmware updates post-wipe depend on EZ Flash** (no Windows, LVFS coverage unverified) | ASUS support page lists Windows packages; `fwupdmgr` unverified | keep the BIOS `.CAP` on a FAT32 USB; check `fwupdmgr get-devices` |
| R5 | **Plasma 6.7 regressions**: OSK "always shows" (bug 522675) and kwin on dGPU via Vulkan (bug 521914) | KDE bug tracker | env guards shipped; `maliit-keyboard` fallback; verify at M1 |
| R6 | **Two writers of `platform_profile`** (asusd vs tuned-ppd) degrade it to `custom` | asusctl MANUAL; kernel ABI docs | ship `asusd.ron` with profile/Epp coupling disabled |
| R7 | Fingerprint (`04f3:0c6e`) may not enrol | listed only in libfprint's development list | verify; document if unsupported |
| R8 | Audio (ALC285) untested for this family | no mainline quirk | verify speakers/mic early; targeted quirk only if needed |
| R9 | akmods/NVIDIA build lag → CI failure | documented module failure mode | pinned `image-version: 44`; failures are build-time |
| R10 | Track B incompatibility with Android 16 community images | unverified pairing | test A16 first, stock A13 GAPPS as fallback |
| R11 | Waydroid project is thinly maintained; pen input in Android broken | issue commentary; waydroid#423 | document; host-side ink workflow |
| R12 | Unknown Wi-Fi/BT chip and touchscreen vendor for 2022 SKUs | no hardware probe available | probe at M1 |
| R13 | 16 GB RAM shared by Plasma + Waydroid + browser | hardware | zram 8 GiB, Waydroid resolution caps, avoid heavy VMs |
| R14 | First boot needs network for Flatpaks | `default-flatpaks` design | documented; nothing else needs the network |

---

**Recovery-specific risks.** The `RECOVERY` partition can only be created at install time - XFS cannot be
shrunk, so adding it later means repartitioning - so get the layout right in Anaconda. `custom.cfg` is
sourced only while bootupd keeps `41_custom.cfg` in its static config; `ujust z13-verify` checks the entries
every run so such a change shows up in a routine check instead of during an outage. A second OS instance
must have its own ESP and `/boot`.

## 9. Milestones

| # | Milestone | Acceptance |
|---|---|---|
| **M0** | Repo + CI green | Both images publish; `cosign verify` passes |
| **M0.5** | Pre-wipe prep | MSDM key saved; Cloud Recovery confirmed; BIOS v322 flashed; 16 GB USB written and checksum-verified |
| **M1** | Installs and boots (whole disk, LUKS) | Anaconda install completes offline; §5.4 layout verification passes; Plasma Wayland at 120 Hz; §7.1 items 2–8 green |
| **M2** | ASUS layer | profiles switch; `platform_profile` shows the right value (not `custom`); battery limit applies |
| **M3** | NVIDIA layer | `nvidia-smi` OK; driver ≥ 595.71; PRIME offload works; external display works; idle desktop is **not** on the dGPU |
| **M4A** | Android 16 GAPPS on iGPU | `waydroid status` RUNNING; Play Store installs; certified; multi-window; touch OK |
| **M4B-0** | MUX spike | A writable MUX attribute found on kernel 7.2; otherwise Track B parked |
| **M4B** | dGPU Android (experimental) | `dumpsys SurfaceFlinger \| grep GLES` shows `ANGLE (NVIDIA … Venus …)`; playable; host stable 30 min; Track A deployment still bootable |
| **M5** | ONLYOFFICE | opens `.docx`/`.xlsx` with correct metrics; associations set |
| **M6** | Installer kit | two ISOs (A/B) with checksums; clean UEFI-VM install reproduces M1–M5; rollback verified |
| **M6b** | Recovery path | `ujust z13-recovery-install --latest` populates the partition and adds both menu entries; booting "install / repair" in a UEFI VM reaches Anaconda with the payload found offline; `ujust z13-verify` reports the recovery checks green |
| **M7** | Reinstall drill | Reinstall over the existing system with `/var` preserved (manual partitioning, no reformat) — data intact |
| **M8** | Upkeep | two weeks of unattended rebuilds; F44 → F45 rehearsal in a VM (F45 lands 2026-10-20) |

---

## 10. Open questions

1. Where exactly does kernel 7.2 expose the ASUS MUX (`/sys/class/fw_attributes/*`)? Answer on hardware (M4B-0) — this is the only thing standing between you and Track B.
2. Does the ELAN fingerprint enrol on this unit?
3. Do the speakers need an ALC285 quirk?
4. Does `KWIN_DISABLE_VULKAN=1` materially change idle dGPU use on Plasma 6.7.5?
5. Wi-Fi chip identity (documentation only).

---

## 11. Sources (primary)

- Fedora Atomic layout/install: `docs.fedoraproject.org/en-US/atomic-desktops/{installation,updates-upgrades-rollbacks}`, Fedora Change *2 GiB /boot partition* (`fedoraproject.org/wiki/Changes/2GbootPartition`), *FedoraSilverblueBootupd*, "What's new for Fedora Atomic Desktops in Fedora 42/43" (Fedora Magazine), tracker issue #110
- bootc: `bootc.dev/bootc/{filesystem,loaders,install-to-disk,rollback,filesystem-encryption}`, `bootc.dev/bootc/man/bootc-install-to-disk.8.html`
- Sealed/UKI: Fedora Magazine *Sealed Fedora Atomic Desktop bootable container images* (2026-04-28), `github.com/travier/fedora-atomic-desktops-sealed` (`repart.d/01-esp.conf`, `02-sysroot.conf`)
- BlueBuild/BCI: `blue-build.org/how-to/generate-iso/`, `blue-build/cli` `generate_iso.rs`, `JasonN3/build-container-installer` (`lorax_templates/install_set_installer.tmpl`, wiki), issue #661 (ISO size)
- Anaconda/RHEL install docs: account-creation-by-variant, Reclaim Space semantics, FAT32 4 GiB limit
- Fedora 44 KDE/Plasma: `packages.fedoraproject.org` (plasma-desktop 6.7.5, plasma-keyboard, maliit-keyboard, tuned-ppd), KDE bug 522675 (OSK) and 521914 (kwin Vulkan), KWin wiki env vars
- ASUS/kernel: `Documentation/ABI/testing/sysfs-platform-asus-wmi` (gpu_mux_mode deprecated → asus-armoury), asusctl MANUAL (`asusd.ron`), `gitlab.com/asus-linux/supergfxctl` issue 178, `github.com/OpenGamingCollective/cardwire`, ASUS support FAQs (F2/F7/F10/Esc boot menu, Fast Boot, Secure Boot, VMD, Cloud Recovery, EZ Flash), ASUS GZ301ZC BIOS v322 page
- Waydroid: `docs.waydro.id`, upstream `data/waydroid.menu`, Fedora `waydroid` spec, WayDroid-ATV release `20260717`, `Shiro836/waydroid-nvidia` (README, install-manual, v0.1.2)
- Flathub API: `org.onlyoffice.desktopeditors` 9.4.0, `com.github.flxzt.rnote`, `com.github.xournalpp.xournalpp`, `org.gnome.Loupe`

---

## 12. Implementation status

**Done** — repo scaffolded, committed, and continuously verified:

| Area | State |
|---|---|
| Recipes | 8 files (`recipe.yml` + 7 module files); all validate against the live `schema.blue-build.org` schemas, 0 errors |
| Device scripts | 7 (`verify`, `gpu-status`, `waydroid-setup`, `oobe`, `mux-spike`, `recovery-install`, `report`) — `bash -n` + `shellcheck -S style` clean, smoke-tested on a non-target host where they degrade to WARN/FAIL instead of crashing |
| ujust surface | `z13-status`, `z13-verify`, `z13-oobe`, `z13-waydroid-setup`, `z13-mux`, `z13-gpu`, `z13-recovery-install`, `z13-recovery-status`, `z13-report` |
| CI | `build.yml` (daily + push + PR, recipe matrix) gates on a `detect` job: with `SIGNING_SECRET` it runs `publish` (signed, rechunked to ≤128 layers), without it `validate` builds the same recipe with `push: false`, so real content errors surface before the key exists. `iso.yml` builds the offline installer (checksum, release attach) behind a `preflight` job that requires a successful `Build and publish the image` job in the triggering run |
| Docs | this plan, now including the partition design (§5), the install runbook (§6) and the recovery tiers (§5.5) |
| Hardware-risk probes | fingerprint: `04f3:0c6e` **is** in libfprint's supported-device list (ElanTech block, nothing Elan in the unsupported section) — so enrolment is plausible on the shipped `libfprint`, pending an on-metal test |
| Official validation | `bluebuild validate recipes/recipe.yml` (CLI 0.9.37, extracted from `ghcr.io/blue-build/cli:latest-installer`) reports *"Recipe recipes/recipe.yml is valid"* — and that traverses all seven `from-file` fragments, so the fragments are validated too. The same check now runs in the `lint` workflow on every push |
| Upstream CI refs | every dependency resolves today: `blue-build/github-action@v1.11`, `ghcr.io/blue-build/cli:latest-installer`, `ghcr.io/ublue-os/akmods:main-44`, `ghcr.io/ublue-os/akmods-nvidia-open:main-44`, `ghcr.io/ublue-os/kinoite-main:{44,latest}` |
| Layer-count limit | the ublue base carries **259 layers** and the build-container-installer the CLI pins (`v1.4.0`, Oct 2025) predates BCI PR #205 ("allow for images with more than 128 layers", merged 2026-07-13, whose body reads *"Ublue has over 128 layers, which prevents the image from being pulled with docker"*). `build_chunked_oci: true` + `max_layers: 128` therefore keep the image pullable for ISO generation |
| Flatpak delivery | `default-flatpaks` v2 ships post-boot Nushell units, so the image build never talks to Flathub |
| systemd unit names | verified against the packaging before they can fail a build: `tuned-ppd.service` (Fedora `tuned` spec), `asusd.service` (`BIN_D := asusd` in asusctl's Makefile), `waydroid-container.service` (Fedora `waydroid` spec). `asusd-user.service` is **not** enabled at build time: upstream's Makefile installs the `asusd-user` binary but has no rule for the unit file, so it is enabled at runtime by `z13-oobe` only if present |
| Pre-CI checks | `actionlint` + `shellcheck` clean; every RPM in the recipes verified to exist for Fedora 44 (this caught `liberation-fonts` not existing); `99-z13.just` parsed and dry-run with the real `just` 1.58 binary; both Waydroid OTA manifests fetched live and the resolved image names/sizes recorded in §4.3 |

Two real bugs were caught by the smoke tests and fixed: a banner helper named `head()` shadowed the external
`head` command (corrupting every `| head -1` capture), and `nvidia-smi` prints query errors on **stdout**, so
all GPU values now go through a validating `gpu_query()`.

**Blocked on you / not yet done**

1. **Add the `SIGNING_SECRET` repository secret** — the only outstanding user action. The repository exists
   and is pushed (`github.com/BaiTian6641/z13-fedora`; SSH auth verified as `BaiTian6641`), and the keypair is
   ready: `cosign.pub` is committed, the matching private key sits at `/tmp/z13-signing/cosign.key` (move it
   somewhere permanent — `/tmp` is wiped on reboot).
   Note the namespace is lowercased on purpose — GHCR rejects mixed-case paths, so images publish to
   `ghcr.io/baitian6641/z13-fedora` (`build.yml` derives the lowercase owner itself).
   Verified before hand-over: `COSIGN_PASSWORD="" cosign public-key --key /tmp/z13-signing/cosign.key`
   reproduces the committed `cosign.pub` byte for byte, so the secret will be accepted rather than failing
   with *"Public key 'cosign.pub' does not match private key"*. The key must also have an **empty**
   password: the CLI hardcodes `COSIGN_PASSWORD: ""` on every cosign invocation
   (`process/drivers/cosign_driver.rs`) — a password-protected keypair would never sign.
   Until the secret exists, every push runs the unsigned `validate` job instead of `publish` (see §12.2), so the
   pipeline stays green and the recipe is exercised — but no image is published.
2. **First CI run** — with the repo and the secret in place, `build.yml` publishes
   `ghcr.io/baitian6641/z13-fedora:44` and `:latest` (daily, plus on push), and `iso.yml` turns that image
   into the offline installer ISO with a checksum. That is milestone **M0** green.
3. **Track B** (`recipe-dgpu.yml`, `waydroid-dgpu.yml`) — created at **M4B**, gated on the MUX spike (`ujust z13-mux`) run on the real machine.
4. **Recovery install path** — `z13-recovery-install` cannot be exercised on this workstation (needs root, a `RECOVERY` partition and an ISO); it is exercised at **M6b** in a UEFI VM, which is also where the GRUB stanzas get proven end to end.
5. `/etc/asusd/asusd.ron` is patched at runtime by `z13-oobe` rather than shipped as a static file, because asusd owns that file and a partial copy could clobber it.

### 12.1 Building without CI (relevant while the repo stays local)

`origin` is `git@github.com:BaiTian6641/z13-fedora.git` and the repo is pushed, so CI produces the image and
the ISO — but a local build works too. Any Fedora 44 machine or VM works; this workstation cannot do it — it is
Ubuntu-on-WSL2, and `bluebuild build` needs podman while `generate-iso` additionally wants loop devices and
root.

```bash
# on a Fedora 44 host or VM
sudo dnf install -y podman git
git clone git@github.com:BaiTian6641/z13-fedora.git   # once the repo exists
cd z13-fedora
sudo bluebuild build recipes/recipe.yml               # image (pushed only if you configure a registry)
sudo bluebuild generate-iso --iso-name z13-fedora.iso image ghcr.io/<owner>/z13-fedora:latest
```

A local-only variant avoids the registry entirely: `bluebuild build recipes/recipe.yml` with
`--push false`, then `bootc switch ostree-unverified-registry:...` on a target machine, or install from a
Fedora live environment with `bootc install to-filesystem`. The ISO route above is the one the install
runbook (§6) assumes.


### 12.2 CI log

| Run | Commit | Result | Root cause / notes |
|---|---|---|---|
| `lint` | `16193e8` | success | actionlint + shellcheck + recipe YAML parse all green on the very first push |
| `bluebuild` | `16193e8` | **no run created** | the first push to the brand-new repo triggered only `lint`; the same workflow fired normally on the next push — a GitHub quirk on initial pushes, not a configuration error |
| `iso` | `38b2ecf` | success, ISO **skipped** | first real exercise of the preflight gate: it read the triggering run's job list, found no `Build and publish the image`, reported `published=false` and skipped the ISO build — instead of burning 20 minutes against an image that does not exist |
| `bluebuild` | `38b2ecf` | **success** (21 min build step) | production chunking validated unsigned: `build_chunked_oci: true` + `max_layers: 128` rechunked the 259-layer base in a 1272 s build step, `publish` skipped |
| `bluebuild` | `e703cdb` | **success** (7 min build step) | `detect` found no secret, so `validate` ran: the full recipe built end-to-end with `push: false` (411 s in the build step) and `publish` was correctly skipped — the first real build of every module chain, and it passed |
| `bluebuild` | `80fd9e9` | **failure** (~23 s) | signing is on by default and `CosignDriver::check_signing_files()` requires a committed `./cosign.pub` plus a matching private key; the repo was created empty, so neither existed |
| — | `0a74d62` | no run (`[skip ci]`) | committed `cosign.pub` (keypair generated locally with cosign 3.1.3) and a `.gitignore` that blocks `cosign.key`/`cosign.private`; `[skip ci]` avoided burning a full build before the secret exists |

The diagnosis is taken from the CLI source, not guessed: `process/drivers/cosign_driver.rs` reads `./cosign.pub`,
derives the public key from `COSIGN_PRIVATE_KEY`, and bails with *"Public key 'cosign.pub' does not match
private key"* when they disagree — so the private key must arrive through the `SIGNING_SECRET` repository
secret and must match the committed public key.

**Unsigned validation path.** A `bluebuild` run is useful without any key: the `detect` job routes pushes to
`validate`, which calls the same action with `push: false`. That is a supported configuration rather than a
hack — `src/commands/build.rs` gates every signing step behind `if self.push && !self.no_sign`, and the
in-recipe `signing` module needs only the committed `cosign.pub`, which the generated `stage-keys` stage copies
into the image (`template/templates/stages.j2`), so the validated recipe is byte-identical to the one that will
publish. Because such a run is green while publishing nothing, `iso.yml` inspects the triggering run for a
successful `Build and publish the image` job and skips (fails closed) when it finds none — verified against
eight job-list payloads, including a green `validate` beside a skipped `publish`.

**Outstanding (user action):** add the repository secret `SIGNING_SECRET` with the contents of
`/tmp/z13-signing/cosign.key` (move that file somewhere permanent first — `/tmp` is wiped on reboot), then
trigger a build. If you prefer your own keypair, replace `cosign.pub` in the repo instead; a mismatch fails
fast with the error above rather than producing a broken image.

**What happens the moment the secret exists** (no further decisions needed):

1. a real (non-`[skip ci]`) push triggers `bluebuild`, which now rechunks to ≤128 layers;
2. on success, `iso.yml` fires automatically via `workflow_run` and publishes the installer + checksum as a
   workflow artifact;
3. I verify criteria 1–3 from the GitHub and GHCR APIs (`cosign verify --key cosign.pub` exits 0), and hand
   you the artifact link;
4. you write it to a ≥16 GB stick (Fedora Media Writer or `dd`), install with the five-partition manual
   layout from §6.3, and paste `ujust z13-report` back — which covers criteria 4–7 in one block.
