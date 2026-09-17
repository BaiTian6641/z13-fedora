#!/usr/bin/env bash
# z13-verify — acceptance checks for z13-fedora on the ASUS ROG Flow Z13 (2022, GZ301ZC).
#
# Usage:
#   z13-verify              full report
#   z13-verify --quick      skip the slower probes (sensors, filesystem inventory)
#   z13-verify --suspend    additionally run one suspend/resume cycle via rtcwake (needs sudo)
#
# Exit status: 0 when nothing failed, 1 otherwise.

set -uo pipefail

QUICK=0
SUSPEND=0
for arg in "$@"; do
  case "$arg" in
    --quick)   QUICK=1 ;;
    --suspend) SUSPEND=1 ;;
    -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
    *) printf 'unknown argument: %s\n' "$arg" >&2; exit 2 ;;
  esac
done

if [[ -t 1 ]]; then
  C_OK=$'\e[32m'; C_WARN=$'\e[33m'; C_BAD=$'\e[31m'; C_HEAD=$'\e[1;36m'; C_OFF=$'\e[0m'
else
  C_OK=; C_WARN=; C_BAD=; C_HEAD=; C_OFF=
fi

pass=0; warn=0; fail=0
ok()   { printf '  %sOK%s    %s\n' "$C_OK"   "$C_OFF" "$*"; pass=$((pass+1)); }
warn() { printf '  %sWARN%s  %s\n' "$C_WARN" "$C_OFF" "$*"; warn=$((warn+1)); }
bad()  { printf '  %sFAIL%s  %s\n' "$C_BAD"  "$C_OFF" "$*"; fail=$((fail+1)); }
info() { printf '  --    %s\n' "$*"; }
section() { printf '\n%s== %s%s\n' "$C_HEAD" "$*" "$C_OFF"; }
have() { command -v "$1" >/dev/null 2>&1; }
rd()   { [[ -r "$1" ]] && cat "$1" 2>/dev/null; }

# nvidia-smi prints query errors on STDOUT ("Field ... is not a valid field to query.") and still
# exits non-zero, so every capture has to be validated rather than trusted.
gpu_query() {
  local out
  out=$(nvidia-smi --query-gpu="$1" --format=csv,noheader 2>/dev/null | head -1 | tr -d '\r')
  case "$out" in
    ""|*"not a valid field"*|*"Field "*|*"failed"*|*"Unable to determine"*) return 1 ;;
  esac
  printf '%s\n' "$out"
}
gpu_procs() {
  nvidia-smi --query-compute-apps=process_name --format=csv,noheader 2>/dev/null \
    | grep -v 'not a valid field' || true
}

printf 'z13-verify — %s\n' "$(rd /etc/os-release | awk -F= '/^PRETTY_NAME=/{gsub(/"/,"",$2); print $2}')"

# ---------------------------------------------------------------- system / updates
section "System"
if have bootc; then
  ok "bootc $(bootc --version 2>/dev/null | head -1)"
  bootc status 2>/dev/null | sed -n '1,6p' | sed 's/^/  --    /'
else
  warn "bootc not found (unexpected on Fedora 42+ atomic images)"
fi
have rpm-ostree && info "rpm-ostree: $(rpm-ostree --version 2>/dev/null | head -1)"

# ---------------------------------------------------------------- disk layout
section "Disk layout (kernel isolation)"
src_root=$(findmnt -no SOURCE / 2>/dev/null || true)
src_boot=$(findmnt -no SOURCE /boot 2>/dev/null || true)
src_esp=$(findmnt -no SOURCE /boot/efi 2>/dev/null || true)
src_var=$(findmnt -no SOURCE /var 2>/dev/null || true)

if [[ -n "$src_esp" ]]; then
  ok "ESP: $src_esp ($(findmnt -no FSTYPE /boot/efi 2>/dev/null))"
else
  bad "no ESP mounted at /boot/efi"
fi
if [[ -n "$src_boot" && "$src_boot" != "$src_root" ]]; then
  ok "/boot is a separate partition: $src_boot ($(findmnt -no FSTYPE /boot 2>/dev/null)) — kernel + initramfs isolated from the OS payload"
else
  bad "/boot is not a separate partition — the kernel lives inside the OS payload"
fi
if [[ -n "$src_var" && "$src_var" != "$src_root" ]]; then
  ok "/var is a separate partition: $src_var — survives a reinstall"
else
  warn "/var is not a separate partition: reinstalling will destroy /var/home and containers"
fi
if [[ -n "$(findmnt -no SOURCE /etc 2>/dev/null || true)" ]]; then
  bad "/etc is a separate mount, which bootc does not support"
else
  ok "/etc is not a separate mount (correct for bootc)"
fi
case "$src_root" in
  /dev/mapper/*|/dev/dm-*) ok "root device is encrypted: $src_root" ;;
  *) warn "root device is not LUKS-encrypted ($src_root)" ;;
esac

if [[ $QUICK -eq 0 ]]; then
  lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINTS "$(lsblk -no PKNAME "$src_root" 2>/dev/null | head -1 | sed 's|^|/dev/|')" 2>/dev/null | sed 's/^/  --    /' || true
  zsize=$(rd /sys/block/zram0/disksize)
  if [[ -n "$zsize" ]]; then
    ok "zram0 configured: $(( zsize / 1024 / 1024 )) MiB"
  else
    warn "no zram device found (expected on Fedora with zram-generator)"
  fi
fi

# ---------------------------------------------------------------- ASUS platform
section "ASUS platform"
if systemctl is-active --quiet asusd.service 2>/dev/null; then
  ok "asusd.service is active"
else
  bad "asusd.service is not active (asusctl package / systemd module)"
fi
have asusctl && info "asusctl: $(asusctl -v 2>/dev/null | head -1)"

pp=$(rd /sys/firmware/acpi/platform_profile)
ppc=$(rd /sys/firmware/acpi/platform_profile_choices)
case "$pp" in
  "" )      bad "platform_profile not exposed by the firmware" ;;
  custom)   warn "platform_profile is 'custom' — usually two writers (asusd + tuned-ppd) fighting; see z13-oobe" ;;
  * )       ok "platform_profile: $pp (choices: ${ppc:-unknown})" ;;
esac

thr=$(rd /sys/class/power_supply/BAT0/charge_control_end_threshold)
[[ -n "$thr" ]] && info "battery charge limit: ${thr}%"
dgd=$(rd /sys/devices/platform/asus-nb-wmi/dgpu_disable)
[[ -n "$dgd" ]] && info "dgpu_disable: ${dgd} (1 = dGPU disabled)"

# ---------------------------------------------------------------- MUX
section "MUX"
found_mux=0
if [[ -d /sys/class/fw_attributes ]]; then
  for d in /sys/class/fw_attributes/*/; do
    [[ -e "$d" ]] || continue
    name=$(basename "$d")
    case "$name" in
      *mux*|*gpu*)
        found_mux=1
        info "armoury attribute '$name' = $(rd "$d/current_value" || echo '?') (possible: $(rd "$d/possible_values" || echo '?'))"
        ;;
    esac
  done
fi
legacy=$(rd /sys/devices/platform/asus-nb-wmi/gpu_mux_mode)
if [[ -n "$legacy" ]]; then
  found_mux=1
  info "legacy gpu_mux_mode = $legacy (0 = dGPU-only, 1 = hybrid)"
fi
if [[ $found_mux -eq 1 ]]; then
  ok "a writable MUX control exists — Track B (dGPU Waydroid) is worth attempting; run 'ujust z13-mux' for details"
else
  warn "no MUX attribute found — dGPU Waydroid (Track B) is blocked on this kernel; run 'ujust z13-mux' for the full attribute list"
fi

# ---------------------------------------------------------------- NVIDIA
section "NVIDIA"
if lsmod 2>/dev/null | grep -q '^nvidia'; then
  ok "nvidia kernel modules loaded"
else
  bad "nvidia kernel modules not loaded (lsmod | grep nvidia)"
fi
if have nvidia-smi; then
  if name=$(gpu_query name) && ver=$(gpu_query driver_version); then
    ok "GPU: $name, driver $ver"
    major=${ver%%.*}
    minor=${ver#*.}; minor=${minor%%.*}
    if [[ "$major" =~ ^[0-9]+$ && "$minor" =~ ^[0-9]+$ ]] && (( major > 595 || ( major == 595 && minor >= 71 ) )); then
      info "driver version satisfies the >= 595.71 requirement of the optional dGPU Waydroid stack"
    else
      warn "driver $ver is older than 595.71 — the optional dGPU Waydroid stack requires 595.71+"
    fi
  else
    bad "nvidia-smi is present but no GPU could be queried (kernel modules / driver problem)"
  fi
  if gpu_procs | grep -qi kwin; then
    warn "kwin_wayland is running on the dGPU — check KWIN_DISABLE_VULKAN (ujust z13-gpu)"
  else
    ok "compositor is not on the dGPU"
  fi
else
  warn "nvidia-smi not installed"
fi
if have glxinfo; then
  r=$(__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo -B 2>/dev/null | awk -F': ' '/OpenGL renderer/{print $2; exit}')
  [[ -n "$r" ]] && ok "PRIME offload renderer: $r" || warn "could not query the PRIME offload renderer (Xwayland may be absent)"
fi
if have vainfo; then
  info "vainfo: $(vainfo 2>/dev/null | awk -F': ' '/Driver version/{print $2; exit}')"
fi

# ---------------------------------------------------------------- input devices
section "Touch, pen, keyboard"
names=$(cat /sys/class/input/input*/name 2>/dev/null | sort -u)
if grep -qiE 'touchscreen|touch screen' <<<"$names"; then ok "touchscreen present"; else bad "no touchscreen input device found"; fi
if grep -qiE 'pen|stylus|digitizer' <<<"$names"; then ok "pen/digitizer present"; else warn "no pen/digitizer input device found"; fi
if grep -qiE 'keyboard|asus' <<<"$names"; then ok "keyboard present (folio attached?)"; else warn "no keyboard input device found"; fi
[[ $QUICK -eq 0 ]] && printf '%s\n' "$names" | sed 's/^/  --    /'

# ---------------------------------------------------------------- sensors / audio / wireless
if [[ $QUICK -eq 0 ]]; then
  head "Sensors, audio, wireless"
  if have monitor-sensor; then
    if timeout 5 monitor-sensor --accel 2>/dev/null | grep -qm1 'Accelerometer'; then
      ok "accelerometer data flowing (iio-sensor-proxy)"
    else
      warn "no accelerometer events within 5 s — auto-rotate may not work on this unit"
    fi
  else
    info "iio-sensor-proxy not installed"
  fi
  if have aplay; then
    if aplay -l 2>/dev/null | grep -q '^card'; then
      ok "audio devices: $(aplay -l 2>/dev/null | grep -c '^card') card(s)"
    else
      bad "no ALSA cards found — check the ALC285 quirk situation"
    fi
  fi
  if have lspci; then
    w=$(lspci -nn 2>/dev/null | grep -iE 'network|wireless' | head -1)
    [[ -n "$w" ]] && info "wireless: $w" || warn "no wireless PCI device detected"
  fi
fi

# ---------------------------------------------------------------- fingerprint
section "Fingerprint"
if have lsusb && lsusb 2>/dev/null | grep -qi '04f3:0c6e'; then
  ok "ELAN fingerprint reader detected (04f3:0c6e)"
  if have fprintd-list; then
    if fprintd-list "$USER" 2>/dev/null | grep -qi 'finger'; then
      ok "at least one fingerprint is enrolled"
    else
      warn "no fingerprints enrolled yet — run: fprintd-enroll"
    fi
  fi
else
  warn "fingerprint reader not detected on USB (or lsusb missing)"
fi

# ---------------------------------------------------------------- waydroid
section "Waydroid"
if have waydroid; then
  st=$(timeout 10 waydroid status 2>/dev/null | sed -n 's/^Session:[[:space:]]*//p' | head -1)
  if [[ -n "$st" ]]; then
    ok "waydroid session: $st"
  else
    info "waydroid installed; session not running (start with: ujust z13-waydroid-setup)"
  fi
  [[ -d /var/lib/waydroid/images ]] && info "Android images present in /var/lib/waydroid/images" \
                                    || info "Android images not downloaded yet (ujust z13-waydroid-setup)"
else
  bad "waydroid package missing"
fi

# ---------------------------------------------------------------- flatpaks
section "Applications"
if have flatpak; then
  if flatpak list --system --app 2>/dev/null | grep -qi onlyoffice; then
    ok "ONLYOFFICE installed (system flatpak)"
  else
    warn "ONLYOFFICE not installed yet — first boot needs network for system flatpaks"
  fi
  info "system remotes: $(flatpak remotes --system 2>/dev/null | awk 'NR>1{print $1}' | paste -sd, -)"
else
  warn "flatpak not installed"
fi

# ---------------------------------------------------------------- suspend (opt-in)
if [[ $SUSPEND -eq 1 ]]; then
  head "Suspend / resume (one cycle)"
  if have rtcwake; then
    before=$(date +%s)
    if sudo rtcwake -m mem -s 20 >/dev/null 2>&1; then
      after=$(date +%s)
      delta=$(( after - before ))
      if (( delta >= 20 )); then
        ok "machine suspended for ~${delta}s and resumed"
      else
        warn "rtcwake returned after only ${delta}s — suspend may not have engaged"
      fi
      if journalctl -b -q --since "-2 min" 2>/dev/null | grep -qiE 'PM: suspend entry|Suspending system'; then
        ok "kernel logged a suspend entry"
      else
        warn "no suspend entry in the journal — check for an immediate resume"
      fi
      if journalctl -b -q --since "-2 min" 2>/dev/null | grep -qiE 'nvidia.*(Xid|failed)|Firmware image loading'; then
        warn "NVIDIA errors around suspend — see journalctl -b | grep -i nvidia"
      fi
    else
      bad "rtcwake failed (needs root and a working RTC)"
    fi
  else
    warn "rtcwake not available (util-linux)"
  fi
fi

# ---------------------------------------------------------------- summary
printf '\n%s== Summary: %d OK, %d warnings, %d failures%s\n' "$C_HEAD" "$pass" "$warn" "$fail" "$C_OFF"
if (( fail > 0 )); then
  printf 'Fix the FAIL lines above, then re-run: ujust z13-verify\n'
  exit 1
fi
printf 'No failures. Next: ujust z13-oobe (first boot), or ujust z13-waydroid-setup (Android).\n'
exit 0
