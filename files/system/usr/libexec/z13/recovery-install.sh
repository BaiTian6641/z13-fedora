#!/usr/bin/env bash
# z13-recovery-install — put a bootable copy of the installer ISO onto the on-disk RECOVERY
# partition and add a GRUB menu entry for it, so this machine can be repaired or reinstalled
# with no USB stick.
#
#   z13-recovery-install <file.iso>            install that ISO onto the recovery partition
#   z13-recovery-install --latest [--repo O/R] download the newest release ISO, then install it
#   z13-recovery-install --status              report the current state (changes nothing)
#   z13-recovery-install --remove              delete the tree and the GRUB entry
#
# Design notes (verified against lorax, anaconda and bootupd sources):
#  * The ISO tree keeps the kernel at /images/pxeboot/vmlinuz, the initrd next to it, the runtime
#    image at /images/install.img and /.treeinfo ("stage2 mainimage = images/install.img").
#  * `inst.stage2=hd:LABEL=RECOVERY` makes anaconda mount that filesystem at /run/install/repo and
#    find stage2 through .treeinfo — so an *extracted* tree works, and the embedded OCI payload of
#    the installer (kickstart: ostreecontainer --url=/run/install/repo/<image_name>) still resolves
#    for offline reinstalls.
#  * Custom menu entries belong in /boot/grub2/custom.cfg: bootupd's static GRUB configuration
#    sources it (41_custom.cfg -> $prefix/custom.cfg), so entries survive updates without touching
#    the generated grub.cfg. Only if that chain is absent do we fall back to /etc/grub.d +
#    grub2-mkconfig.
#
# Expects a plain ext4 filesystem labelled RECOVERY mounted at /mnt/recovery — the layout the
# install runbook creates (PLAN.md §5.2). It is deliberately NOT encrypted: it is the thing that
# has to boot when the encrypted root does not.

set -euo pipefail

LABEL="RECOVERY"
MNT="/mnt/recovery"
CUSTOM_CFG="/boot/grub2/custom.cfg"
GRUB_CFG="/boot/grub2/grub.cfg"
ISO_MNT="/run/z13-recovery-iso"
BEGIN_MARK="# z13-fedora recovery begin"
END_MARK="# z13-fedora recovery end"
MENU_MATCH="Z13 Fedora recovery"
REPO="${Z13_REPO:-}"

say()  { printf '\n== %s\n' "$*"; }
info() { printf '   %s\n' "$*"; }
die()  { printf 'ERROR: %s\n' "$*" >&2; exit 1; }
have() { command -v "$1" >/dev/null 2>&1; }

if [[ $EUID -ne 0 ]]; then
  exec sudo -- "$(readlink -f "$0")" "$@"
fi

part_dev()      { blkid -L "$LABEL" 2>/dev/null || true; }
entry_present() { grep -qF "$MENU_MATCH" "$CUSTOM_CFG" 2>/dev/null || grep -qF "$MENU_MATCH" "$GRUB_CFG" 2>/dev/null; }
tree_present()  { [[ -f "$MNT/images/pxeboot/vmlinuz" && -f "$MNT/.treeinfo" ]]; }
custom_sourced(){ grep -qs 'custom\.cfg' "$GRUB_CFG" 2>/dev/null; }

# ---------------------------------------------------------------- status
do_status() {
  say "Recovery partition"
  dev=$(part_dev)
  if [[ -n "$dev" ]]; then
    info "label $LABEL -> $dev ($(lsblk -no SIZE "$dev" 2>/dev/null | head -1))"
    if mountpoint -q "$MNT"; then
      info "mounted at $MNT — used $(df -h "$MNT" 2>/dev/null | awk 'NR==2{print $3" of "$2}')"
    else
      info "not mounted (mount with: sudo mount LABEL=$LABEL $MNT)"
    fi
  else
    info "no filesystem labelled $LABEL found — was the partition created at install time?"
  fi

  say "Recovery tree"
  if tree_present; then
    info "installer tree present at $MNT"
    [[ -r "$MNT/.treeinfo" ]] && info "release: $(awk -F' = ' '/^version =/{v=$2} /^variant =/{n=$2} END{print n" "v}' "$MNT/.treeinfo")"
    info "size on disk: $(du -sh "$MNT" 2>/dev/null | cut -f1)"
  else
    info "no installer tree yet — run: ujust z13-recovery-install --latest"
  fi

  say "GRUB entry"
  if entry_present; then
    if grep -qF "$MENU_MATCH" "$CUSTOM_CFG" 2>/dev/null; then
      info "menu entries present in $CUSTOM_CFG (sourced by bootupd's static grub.cfg)"
    else
      info "menu entry present in $GRUB_CFG (via $GRUB_FRAG)"
    fi
  else
    info "no recovery menu entry found"
  fi
  if [[ -f /boot/grub2/user.cfg ]] && grep -qE '^[[:space:]]*set[[:space:]]+timeout=' /boot/grub2/user.cfg; then
    info "menu timeout: $(grep -E '^[[:space:]]*set[[:space:]]+timeout=' /boot/grub2/user.cfg | tail -1) (in /boot/grub2/user.cfg)"
  else
    info "menu timeout not set — the GRUB menu may be hidden, so you could not pick the previous deployment"
  fi
  if have ostree; then
    info "pinned deployments: $(ostree admin status 2>/dev/null | grep -c pinned || echo 0) (pin a good one: sudo ostree admin pin 0)"
  fi
}

# ---------------------------------------------------------------- GRUB entries
write_grub_entries() {
  local grubconf="" cmdline="" kpath="" ipath="" block

  for candidate in "$MNT/EFI/BOOT/grub.cfg" "$MNT/boot/grub2/grub.cfg" "$MNT/isolinux/isolinux.cfg"; do
    [[ -r "$candidate" ]] && { grubconf="$candidate"; break; }
  done
  [[ -n "$grubconf" ]] || die "could not find the ISO's boot configuration under $MNT"

  # lorax writes entries like:  linux /images/pxeboot/vmlinuz <options>
  cmdline=$(grep -m1 -oE 'linu[x]?efi?[[:space:]]+[^[:space:]]+[[:space:]]+.*' "$grubconf" | sed -E 's/^[^[:space:]]+[[:space:]]+[^[:space:]]+[[:space:]]+//' || true)
  kpath=$(grep -m1 -oE 'linu[x]?efi?[[:space:]]+[^[:space:]]+' "$grubconf" | awk '{print $2}' || true)
  ipath=$(grep -m1 -oE 'initrd[[:space:]]+[^[:space:]]+' "$grubconf" | awk '{print $2}' || true)

  kpath="${kpath:-/images/pxeboot/vmlinuz}"
  ipath="${ipath:-/images/pxeboot/initrd.img}"
  if [[ -z "$cmdline" ]]; then
    info "no kernel options found in $grubconf — using inst.stage2=hd:LABEL=$LABEL only"
    cmdline="inst.stage2=hd:LABEL=$LABEL"
  fi
  # Always point stage2 at our own partition, whatever label the ISO used.
  if grep -q 'inst\.stage2=' <<<"$cmdline"; then
    cmdline=$(sed -E "s#inst\.stage2=[^[:space:]]+#inst.stage2=hd:LABEL=$LABEL#g" <<<"$cmdline")
  else
    cmdline="inst.stage2=hd:LABEL=$LABEL $cmdline"
  fi
  # Drop options that only make sense on real installation media.
  cmdline=$(tr ' ' '\n' <<<"$cmdline" | grep -vE '^(rd\.live\.check|check|mediacheck)$' | paste -sd' ' -)

  info "kernel:  $kpath"
  info "initrd:  $ipath"
  info "options: $cmdline"

  block="$BEGIN_MARK
menuentry 'Z13 Fedora recovery (install / repair)' --class recovery {
    insmod part_gpt
    insmod ext2
    search --no-floppy --set=root --label $LABEL
    linux $kpath $cmdline
    initrd $ipath
}
menuentry 'Z13 Fedora recovery (rescue shell)' --class recovery {
    insmod part_gpt
    insmod ext2
    search --no-floppy --set=root --label $LABEL
    linux $kpath $cmdline inst.rescue
    initrd $ipath
}
$END_MARK"

  if ! custom_sourced; then
    die "$GRUB_CFG does not source custom.cfg, so this is not a bootupd-managed Atomic install.
Refusing to touch the bootloader: on Fedora Atomic the GRUB config is owned by bootupd and is static,
and running grub2-mkconfig (or adding /etc/grub.d entries) overwrites it — explicitly unsupported.
Check the bootupd state first: /boot/bootupd-state.json and 'bootupctl status'."
  fi

  touch "$CUSTOM_CFG"
  sed -i "/^${BEGIN_MARK//./\\.}\$/,/^${END_MARK//./\\.}\$/d" "$CUSTOM_CFG" 2>/dev/null || true
  printf '%s\n' "$block" >>"$CUSTOM_CFG"
  if grep -qF "$MENU_MATCH" "$CUSTOM_CFG"; then
    info "menu entries written and verified in $CUSTOM_CFG"
  else
    die "wrote $CUSTOM_CFG but the entries are not there — check permissions"
  fi
}

# The GRUB menu is hidden/instant by default on Atomic; without a timeout you cannot pick the
# previous deployment. user.cfg is sourced by bootupd's static config and persists.
ensure_menu_timeout() {
  local user_cfg="/boot/grub2/user.cfg"
  if [[ -f "$user_cfg" ]] && grep -qE '^[[:space:]]*set[[:space:]]+timeout=' "$user_cfg"; then
    info "GRUB menu timeout already configured in $user_cfg"
  else
    printf 'set timeout=5\n' >>"$user_cfg"
    info "set a 5 s GRUB menu timeout in $user_cfg"
  fi
}

# ---------------------------------------------------------------- install from an ISO
install_iso() {
  local iso="$1"
  [[ -f "$iso" ]] || die "no such file: $iso"
  [[ -n "$(part_dev)" ]] || die "no partition labelled $LABEL.
Create it at install time (PLAN.md §5.2/§6.3), or prepare an existing partition now with:
    sudo mkfs.ext4 -L $LABEL /dev/nvme0n1pN && sudo mount LABEL=$LABEL $MNT"

  say "Checking the ISO"
  blkid -p "$iso" >/dev/null 2>&1 || die "$iso does not look like a filesystem image"
  info "volume label: $(blkid -p -o value -s LABEL "$iso" 2>/dev/null || echo '?')   size: $(du -h "$iso" | cut -f1)"

  mkdir -p "$ISO_MNT"
  mountpoint -q "$ISO_MNT" || mount -o loop,ro "$iso" "$ISO_MNT"
  if [[ ! -f "$ISO_MNT/images/pxeboot/vmlinuz" || ! -f "$ISO_MNT/.treeinfo" ]]; then
    umount "$ISO_MNT" || true
    die "$iso is missing images/pxeboot/vmlinuz or .treeinfo — not a bootable installer ISO"
  fi
  info "kernel, initrd and stage2 metadata found inside the ISO"

  say "Mounting the recovery partition"
  mkdir -p "$MNT"
  if mountpoint -q "$MNT"; then
    info "$MNT already mounted"
  else
    mount "LABEL=$LABEL" "$MNT"
    info "mounted $(part_dev) at $MNT"
  fi

  say "Copying the installer tree — this takes a few minutes"
  rm -rf "${MNT:?}/"*
  cp -a "$ISO_MNT/." "$MNT/"
  sync
  umount "$ISO_MNT"
  info "copied $(du -sh "$MNT" | cut -f1) to $MNT"

  say "Boot menu and GRUB entries"
  ensure_menu_timeout
  write_grub_entries

  say "Done"
  info "Boot menu now offers:"
  info "  * Z13 Fedora recovery (install / repair)  — full Anaconda, can reinstall offline"
  info "  * Z13 Fedora recovery (rescue shell)     — inst.rescue debugging shell"
  info "Re-run this tool after building a newer ISO; the tree is replaced, the entries refreshed."
}

# ---------------------------------------------------------------- --latest
fetch_latest() {
  [[ -n "$REPO" ]] || die "set Z13_REPO=owner/name (or pass --repo owner/name) to use --latest"
  have curl || die "curl is required"
  have jq   || die "jq is required (or download the ISO and pass its path instead)"
  say "Finding the newest ISO among the releases of $REPO"
  url=$(curl -fsSL "https://api.github.com/repos/$REPO/releases" \
        | jq -r '[.[].assets[] | select(.name | endswith(".iso"))] | sort_by(.created_at) | last | .browser_download_url // empty')
  [[ -n "$url" ]] || die "no .iso asset found in the releases of $REPO"
  out="/var/tmp/$(basename "$url")"
  info "downloading $url"
  curl -fL --progress-bar -o "$out" "$url"
  install_iso "$out"
}

# ---------------------------------------------------------------- main
case "${1:-}" in
  --status|status|"")  do_status ;;
  --remove)
    say "Removing the recovery tree and GRUB entries"
    if mountpoint -q "$MNT"; then rm -rf "${MNT:?}/"*; sync; info "tree removed"; else info "$MNT not mounted; nothing to delete"; fi
    if [[ -f "$CUSTOM_CFG" ]]; then
      sed -i "/^${BEGIN_MARK//./\\.}\$/,/^${END_MARK//./\\.}\$/d" "$CUSTOM_CFG" || true
      info "entries removed from $CUSTOM_CFG"
    fi
    if [[ -f /etc/grub.d/40_z13_recovery ]]; then
      rm -f /etc/grub.d/40_z13_recovery
      info "removed a legacy /etc/grub.d fragment left by an older version of this tool"
    fi
    ;;
  --latest)
    shift || true
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --repo) REPO="$2"; shift 2 ;;
        *) die "unknown argument: $1" ;;
      esac
    done
    fetch_latest
    ;;
  -h|--help|help) sed -n '2,30p' "$0" ;;
  *) install_iso "$1" ;;
esac
