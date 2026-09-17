#!/usr/bin/env bash
# z13-waydroid-setup — initialize or refresh Waydroid with Android 16 QPR2 (LineageOS 23.2) GAPPS
# images, then apply the props that make it comfortable on the Flow Z13.
#
# Usage:
#   z13-waydroid-setup              init if needed, then report certification status
#   z13-waydroid-setup --force      wipe the Android data and re-init (destructive)
#   z13-waydroid-setup --stock      use Waydroid's official OTA channel (Android 13 GAPPS) instead
#                                 - the channel where ARM translation (libndk) is known-good
#
# Everything here is idempotent: re-running without --force only re-applies props.

set -euo pipefail

SYSTEM_OTA="https://waydroid-atv.github.io/ota/a16-qpr2/system"
VENDOR_OTA="https://waydroid-atv.github.io/ota/a16-qpr2/vendor"
ROM_TYPE="lineage"
SYSTEM_TYPE="GAPPS"
FORCE=0

for arg in "$@"; do
  case "$arg" in
    --force) FORCE=1 ;;
    --stock)
      SYSTEM_OTA="https://ota.waydro.id/system"
      VENDOR_OTA="https://ota.waydro.id/vendor"
      ;;
    -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
    *) printf 'unknown argument: %s\n' "$arg" >&2; exit 2 ;;
  esac
done

printf '\n== Waydroid setup (%s, %s)\n' "$SYSTEM_TYPE" "$ROM_TYPE"
printf '   system channel: %s\n   vendor channel: %s\n\n' "$SYSTEM_OTA" "$VENDOR_OTA"

if ! command -v waydroid >/dev/null 2>&1; then
  printf 'ERROR: waydroid is not installed. It should be part of this image.\n' >&2
  exit 1
fi

# The -c/-v arguments are channel *prefixes*, and upstream builds the two manifest URLs differently
# (tools/actions/initializer.py):
#   system: <channel>/<rom>/waydroid_<arch>/<system_type>.json
#   vendor: <channel>/waydroid_<arch>/<vendor>.json          <- no rom segment
# So a bare channel URL returns 404 in a browser; that is expected. Verify both manifests before
# pulling ~1.5 GB, and show exactly which images are about to be fetched.
preflight_channel() {
  local kind="$1" url="$2" json name size
  if ! command -v curl >/dev/null 2>&1; then
    printf -- '-- %s: curl missing, skipping preflight (%s)\n' "$kind" "$url"
    return 0
  fi
  if ! json=$(curl -fsSL --max-time 30 "$url" 2>/dev/null); then
    printf -- '!! %s manifest unreachable: %s\n' "$kind" "$url"
    return 1
  fi
  if command -v jq >/dev/null 2>&1; then
    name=$(jq -r '.response[0].filename // empty' <<<"$json" 2>/dev/null)
    size=$(jq -r '.response[0].size // 0' <<<"$json" 2>/dev/null)
  else
    # Fedora does not ship jq by default; fall back to a plain text extraction.
    name=$(sed -n 's/.*"filename"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' <<<"$json" | head -1)
    size=$(sed -n 's/.*"size"[[:space:]]*:[[:space:]]*\([0-9]\+\).*/\1/p' <<<"$json" | head -1)
  fi
  if [[ -n "${name:-}" ]]; then
    printf -- '-- %s: %s (%s MiB)\n' "$kind" "$name" "$(( ${size:-0} / 1048576 ))"
  else
    printf -- '-- %s manifest OK: %s\n' "$kind" "$url"
  fi
  return 0
}

SYS_MANIFEST="${SYSTEM_OTA}/${ROM_TYPE}/waydroid_x86_64/${SYSTEM_TYPE}.json"
VEN_MANIFEST="${VENDOR_OTA}/waydroid_x86_64/MAINLINE.json"
if ! preflight_channel "system image" "$SYS_MANIFEST" \
   || ! preflight_channel "vendor image" "$VEN_MANIFEST"; then
  printf '\nThe configured channel did not answer. Options:\n'
  printf '  * retry later (the OTA host may be down), or\n'
  printf '  * use the official Android 13 channel instead: %s --stock\n' "$0"
  printf '  * or download system.zip + vendor.zip by hand from the project release page, put\n'
  printf '    system.img and vendor.img into /etc/waydroid-extra/images/, then run: sudo waydroid init -f\n'
  exit 1
fi

# --- container service -----------------------------------------------------------------
if systemctl is-enabled --quiet waydroid-container.service 2>/dev/null; then
  printf -- '-- container service already enabled\n'
else
  sudo systemctl enable waydroid-container.service
  printf -- '-- container service enabled\n'
fi
sudo systemctl start waydroid-container.service
printf -- '-- container service started\n'

# --- images ----------------------------------------------------------------------------
if [[ $FORCE -eq 1 ]]; then
  printf -- '-- --force: stopping session/container and wiping Android data\n'
  waydroid session stop 2>/dev/null || true
  sudo waydroid container stop 2>/dev/null || true
  rm -rf "$HOME/.local/share/waydroid" 2>/dev/null || true
  sudo rm -rf /var/lib/waydroid/overlay /var/lib/waydroid/overlay_rw 2>/dev/null || true
fi

if [[ -f /var/lib/waydroid/images/system.img && $FORCE -eq 0 ]]; then
  printf -- '-- Android images already present; refreshing them (waydroid upgrade)\n'
  sudo waydroid upgrade
else
  printf -- '-- downloading Android images (~1.4 GB system + 0.2 GB vendor); this needs network\n'
  sudo waydroid init -f -c "$SYSTEM_OTA" -v "$VENDOR_OTA" -r "$ROM_TYPE" -s "$SYSTEM_TYPE"
  sudo waydroid upgrade
fi

# --- props -----------------------------------------------------------------------------
# Props are written to /var/lib/waydroid/waydroid.prop and survive restarts.
printf -- '-- applying props\n'
waydroid prop set persist.waydroid.multi_windows true   || printf '   (prop set failed; the session may need to be running)\n'
# Camera passthrough is off by default; Android apps then see no camera at all.
waydroid prop set persist.waydroid.camera true          || printf '   (camera prop failed)\n'
# 1920x1200 panel: keep Android at native resolution; adjust if the UI feels too small/large
waydroid prop set persist.waydroid.width 1920            || true
waydroid prop set persist.waydroid.height 1200           || true

# --- start + certification -------------------------------------------------------------
printf -- '-- starting session\n'
( waydroid session start >/dev/null 2>&1 & ) || true

printf '\n== Google Play certification\n'
printf '   The GAPPS image starts "uncertified". Register this device once:\n'
id_try=$(sudo waydroid shell -- sh -c \
  'sqlite3 /data/data/*/*/gservices.db "select value from main where name = \"android_id\";"' 2>/dev/null | tr -d '\r' | head -1 || true)
if [[ -n "${id_try:-}" ]]; then
  printf '   Android ID: %s\n   Register it at: https://www.google.com/android/uncertified\n' "$id_try"
  printf '   then restart the session: waydroid session stop && waydroid session start\n'
else
  printf '   The container is not ready yet. Once it is, run:\n'
  printf '     sudo waydroid shell -- sh -c %s\n' "'sqlite3 /data/data/*/*/gservices.db \"select value from main where name = \\\"android_id\\\";\"'"
  printf '   and register the printed ID at https://www.google.com/android/uncertified\n'
fi

printf '\n== Optional: ARM app translation\n'
printf '   Android apps with ARM-only native libraries need a translation layer.\n'
printf '   Do NOT install libhoudini: its builds carry an expiry that fired on 2026-01-01, after\n'
printf '   which translated apps hang on their splash screen at ~100%% CPU with nothing in the\n'
printf '   logs (waydroid-helper#78, casualsnek/waydroid_script#257). libndk is the live option:\n'
printf '     git clone https://github.com/casualsnek/waydroid_script && cd waydroid_script\n'
printf '     python3 -m venv venv && venv/bin/pip install -r requirements.txt\n'
printf '     sudo venv/bin/python3 main.py install libndk\n'
printf '   There are no reports yet of libndk working on Android 16. If ARM-only apps misbehave,\n'
printf '   re-image with --stock (Android 13 GAPPS), where the layer is known-good, and install it\n'
printf '   there. Upgrades wipe the layer, so re-run the install afterwards.\n'

printf '\n== Android apps in the KDE menu (#9)\n'
printf '   Waydroid writes ~/.local/share/applications/waydroid-*.desktop for each Android app,\n'
printf "   but only once a session has run. Refreshing KDE's cache now:\n"
if command -v kbuildsycoca6 >/dev/null 2>&1; then
  kbuildsycoca6 --noincremental >/dev/null 2>&1 || true
  n=$(find "$HOME/.local/share/applications" -maxdepth 1 -name 'waydroid-*.desktop' 2>/dev/null | wc -l)
  printf "   %s waydroid desktop entries present; KDE menu cache rebuilt (log out/in if still absent)\n" "$n"
else
  printf '   kbuildsycoca6 not found; log out/in to rebuild the menu\n'
fi

printf '\n== Notes\n'
printf '   - Rendering runs on the Intel iGPU. Waydroid refuses NVIDIA render nodes by design.\n'
printf '   - Stylus input inside Android apps is broken upstream (waydroid#423).\n'
printf '   - Clipboard sync is unreliable; use a shared folder for file exchange.\n'
printf '   - Multi-window is enabled; per-app launchers appear in the app menu.\n'
printf '\nDone. Check status with: waydroid status\n'
