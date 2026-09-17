#!/usr/bin/env bash
# z13-oobe — one-shot post-install setup for the Flow Z13 image.
#
# Everything is idempotent and non-destructive: it enables services, resolves the
# platform_profile ownership question between asusd and tuned-ppd, reports the MUX state, and
# prints the few steps that must be done by hand (fingerprint enrolment, TPM2 unlock, Waydroid).

set -uo pipefail

say()  { printf '\n== %s\n' "$*"; }
info() { printf '   %s\n' "$*"; }

say "Services"
# Trust the unit state, not the exit code of sudo+systemctl.
if ! systemctl is-active --quiet asusd.service 2>/dev/null; then
  sudo systemctl enable --now asusd.service 2>/dev/null || true
fi
if systemctl is-active --quiet asusd.service 2>/dev/null; then
  info "asusd.service: active"
else
  info "asusd.service: NOT active — check 'systemctl status asusd' (is asusctl installed?)"
fi
if ! systemctl is-active --quiet tuned-ppd.service 2>/dev/null; then
  sudo systemctl enable --now tuned-ppd.service 2>/dev/null || true
fi
if systemctl is-active --quiet tuned-ppd.service 2>/dev/null; then
  info "tuned-ppd.service: active (Fedora 44's power-profiles-daemon provider)"
else
  info "tuned-ppd.service: NOT active — check 'systemctl status tuned-ppd'"
fi

# asusd-user is a per-session *user* unit (Aura/keyboard settings). Upstream's Makefile installs the
# binary but has no rule for the unit file, so it is not reliably packaged — enable it here, at
# runtime, only if it actually exists, rather than failing the image build over it.
if [[ -f /usr/lib/systemd/user/asusd-user.service ]]; then
  if systemctl --global is-enabled asusd-user.service >/dev/null 2>&1; then
    info "asusd-user.service: already enabled for all users"
  elif sudo systemctl --global enable asusd-user.service 2>/dev/null; then
    info "asusd-user.service: enabled for all users (log out/in to start it)"
  else
    info "asusd-user.service: present but could not be enabled"
  fi
else
  info "asusd-user.service: not shipped by this asusctl build (skipped)"
fi
info "active tuned profile: $(tuned-adm active 2>/dev/null | sed 's/^Current active profile: //' || echo unknown)"

say "platform_profile ownership (asusd vs tuned-ppd)"
RON=/etc/asusd/asusd.ron
if [[ -f "$RON" ]]; then
  cp -n "$RON" "$RON.bak" 2>/dev/null || true
  changed=0
  for key in change_platform_profile_on_ac change_platform_profile_on_battery platform_profile_linked_epp; do
    if grep -q "$key" "$RON"; then
      sed -i -E "s/^([[:space:]]*${key}[[:space:]]*:[[:space:]]*)true/\1false/" "$RON"
      changed=1
    fi
  done
  if [[ $changed -eq 1 ]]; then
    info "set asusd to stop writing platform_profile/EPP (backup at $RON.bak); restarting asusd"
    sudo systemctl restart asusd.service 2>/dev/null || true
  else
    info "no platform-profile keys found in $RON — nothing to change"
  fi
else
  info "$RON does not exist yet. Expected keys (set them to false if the file appears):"
  info "  change_platform_profile_on_ac: false"
  info "  change_platform_profile_on_battery: false"
  info "  platform_profile_linked_epp: false"
fi
pp=$(cat /sys/firmware/acpi/platform_profile 2>/dev/null || echo unknown)
if [[ "$pp" == "custom" ]]; then
  info "WARNING: platform_profile is 'custom' — two writers are still active; re-check after a reboot"
else
  info "platform_profile: $pp (choices: $(cat /sys/firmware/acpi/platform_profile_choices 2>/dev/null || echo unknown))"
fi

say "Graphics"
/usr/libexec/z13/mux-spike.sh status 2>/dev/null | sed 's/^/   /' || info "mux report unavailable"
if command -v nvidia-smi >/dev/null 2>&1; then
  info "GPU: $(nvidia-smi --query-gpu=name,driver_version --format=csv,noheader 2>/dev/null | head -1)"
  if nvidia-smi --query-compute-apps=process_name --format=csv,noheader 2>/dev/null | grep -qi kwin; then
    info "WARNING: kwin_wayland is on the dGPU; KWIN_DISABLE_VULKAN is set in the session guard — log out and back in"
  fi
fi

say "Fingerprint"
if lsusb 2>/dev/null | grep -qi '04f3:0c6e'; then
  if fprintd-list "$USER" 2>/dev/null | grep -qi finger; then
    info "fingerprint already enrolled"
  else
    info "ELAN reader detected. Enrol it now with:  fprintd-enroll"
  fi
else
  info "no ELAN fingerprint reader detected on USB — fingerprint login may be unsupported on this unit"
fi

say "Disk encryption (optional TPM2 auto-unlock)"
root_src=$(findmnt -no SOURCE / 2>/dev/null || true)
case "$root_src" in
  /dev/mapper/*|/dev/dm-*)
    info "root is encrypted ($root_src). To unlock automatically at boot with the TPM:"
    info "  systemd-cryptenroll --tpm2-device list"
    info "  sudo systemd-cryptenroll --tpm2-device=/dev/tpmrm0 --tpm2-pcrs=7:sha256 <backing-device>"
    info "  (PCR 7 binds to Secure Boot state — read the caveat in PLAN.md §5 before doing this)"
    ;;
  *) info "root is not encrypted; nothing to do" ;;
esac

say "Android (Waydroid)"
if [[ -f /var/lib/waydroid/images/system.img ]]; then
  info "Android images are present. Start it with:  waydroid session start"
else
  info "Android images are not downloaded yet (~1.6 GB). Run:  ujust z13-waydroid-setup"
fi

say "Recovery"
if [[ -n "$(blkid -L RECOVERY 2>/dev/null || true)" ]]; then
  if [[ -f /mnt/recovery/.treeinfo ]]; then
    info "on-disk recovery environment is installed — manage it with: ujust z13-recovery-status"
  else
    info "RECOVERY partition exists but is empty. Install the environment: ujust z13-recovery-install --latest"
  fi
else
  info "no partition labelled RECOVERY — it has to be created at install time (PLAN.md §5.2)"
fi
if [[ -f /boot/grub2/user.cfg ]] && grep -qE '^[[:space:]]*set[[:space:]]+timeout=' /boot/grub2/user.cfg; then
  info "GRUB menu timeout: configured (you can pick the previous deployment at boot)"
else
  info "GRUB menu timeout is NOT set — the menu may not appear, leaving no way to pick the previous deployment"
  info "  fix: echo 'set timeout=5' | sudo tee -a /boot/grub2/user.cfg"
fi
info "before risky changes, protect a known-good deployment:  sudo ostree admin pin 0"

say "Next"
info "Full hardware check:  ujust z13-verify          (add -- --suspend for a suspend test)"
info "GPU report:           ujust z13-gpu"
info "MUX details:          ujust z13-mux"
