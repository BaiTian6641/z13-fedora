#!/usr/bin/env bash
# z13-report — collect everything the acceptance criteria need into one paste-ready block.
#
# Run it on the installed Z13 and paste the whole output (it is fenced by markers) back into the
# project chat. It is read-only: it runs the same checks as the individual ujust recipes and adds
# the raw device/registry facts, but changes nothing.
#
# Usage: z13-report          everything
#        z13-report --fast   skip the slower probes (sensors, filesystem inventory)

set -uo pipefail

FAST=""
[[ "${1:-}" == "--fast" ]] && FAST="--quick"

HERE="$(dirname "$(readlink -f "$0")")"

section() { printf '\n----- %s -----\n' "$*"; }

printf '========== z13-report ==========\n'
printf 'date:   %s\n' "$(date -Is 2>/dev/null || date)"
printf 'host:   %s\n' "$(hostnamectl --static 2>/dev/null || cat /etc/hostname 2>/dev/null || echo '?')"
printf 'os:     %s\n' "$(awk -F= '/^PRETTY_NAME=/{gsub(/"/,"",$2); print $2}' /etc/os-release 2>/dev/null)"
printf 'kernel: %s\n' "$(uname -r)"
printf 'image:  %s\n' "$(bootc status --json 2>/dev/null | sed -n 's/.*"image"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1 || echo '?')"

# --- acceptance criterion 4 -------------------------------------------------------------------
section "ujust z13-verify (criterion 4: must exit 0 with zero FAIL lines)"
"$HERE/verify.sh" $FAST
printf 'verify_exit=%s\n' "$?"

# --- acceptance criterion 5 -------------------------------------------------------------------
section "recovery status (criterion 5)"
"$HERE/recovery-install.sh" --status 2>&1 || true

# --- acceptance criterion 6 -------------------------------------------------------------------
section "MUX finding (criterion 6)"
"$HERE/mux-spike.sh" status 2>&1 || true
"$HERE/mux-spike.sh" list 2>&1 | head -40 || true

# --- acceptance criterion 7: raw facts the user checks by hand --------------------------------
section "NVIDIA (criterion 7: expect the RTX 3050 and a driver >= 595.71)"
if command -v nvidia-smi >/dev/null 2>&1; then
  nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader 2>/dev/null || echo "nvidia-smi query failed"
  printf 'PRIME offload: %s\n' "$(__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo -B 2>/dev/null | awk -F': ' '/OpenGL renderer/{print $2; exit}' || echo 'glxinfo unavailable')"
else
  echo "nvidia-smi not installed"
fi

section "ASUS platform"
printf 'asusctl: %s\n' "$(asusctl -v 2>/dev/null | head -1 || echo 'not installed')"
printf 'platform_profile: %s (choices: %s)\n' "$(cat /sys/firmware/acpi/platform_profile 2>/dev/null || echo '?')" "$(cat /sys/firmware/acpi/platform_profile_choices 2>/dev/null || echo '?')"
printf 'profile via tuned: %s\n' "$(tuned-adm active 2>/dev/null | sed 's/^Current active profile: //' || echo '?')"
printf 'battery limit: %s%%\n' "$(cat /sys/class/power_supply/BAT*/charge_control_end_threshold 2>/dev/null | head -1 || echo 'n/a')"

section "Android / Waydroid"
if command -v waydroid >/dev/null 2>&1; then
  printf 'init service: %s\n' "$(systemctl is-active z13-waydroid-init.service 2>/dev/null || true)"
  printf 'container service: %s (enabled: %s)\n' "$(systemctl is-active waydroid-container.service 2>/dev/null)" "$(systemctl is-enabled waydroid-container.service 2>/dev/null)"
  timeout 10 waydroid status 2>/dev/null || echo "waydroid status timed out"
  printf 'baked images: %s\n' "$(du -h /usr/share/waydroid-extra/images/*.img 2>/dev/null | paste -sd' ' || echo missing)"
  printf 'cfg images_path: %s\n' "$(grep -E 'images_path|system_ota' /var/lib/waydroid/waydroid.cfg 2>/dev/null | paste -sd' ' || echo 'no cfg - init not run')"
  printf 'binder nodes: %s\n' "$(find /dev -maxdepth 2 -name '*binder*' 2>/dev/null | paste -sd' ' || echo none)"
  echo '--- waydroid log (last 25 lines) ---'
  sudo tail -25 /var/lib/waydroid/waydroid.log 2>/dev/null || echo '(no log)'
  echo '--- container journal (last 25 lines) ---'
  sudo journalctl -u waydroid-container.service -b --no-pager 2>/dev/null | tail -25
  echo '--- SELinux denials mentioning waydroid/lxc (this boot) ---'
  sudo ausearch -m avc -ts boot 2>/dev/null | grep -iE 'waydroid|lxc|binder' | tail -10 || echo '(none)'
  printf 'certification id: %s\n' "$(sudo waydroid shell -- sh -c 'sqlite3 /data/data/*/*/gservices.db "select value from main where name = \"android_id\";"' 2>/dev/null | tr -d '\r' | head -1 || echo 'container not running')"
else
  echo "waydroid not installed"
fi

section "ONLYOFFICE (criterion 7)"
flatpak list --system --app 2>/dev/null | grep -i onlyoffice || echo "ONLYOFFICE system flatpak not present"
printf 'associations: %s\n' "$(xdg-mime query default application/vnd.openxmlformats-officedocument.wordprocessingml.document 2>/dev/null || echo '?')"

section "Input devices (criterion 7: touch / pen / keyboard)"
cat /sys/class/input/input*/name 2>/dev/null | sort -u | sed 's/^/  /'

section "Audio (criterion 7)"
if command -v aplay >/dev/null 2>&1; then aplay -l 2>/dev/null | sed -n 's/^card/  card/p' | head -6; else echo "  aplay not installed"; fi

section "Fingerprint"
if command -v fprintd-list >/dev/null 2>&1; then
  fprintd-list "$USER" 2>&1 | head -5 || true
else
  echo "fprintd-list not installed"
fi

printf '\n========== end z13-report ==========\n'
