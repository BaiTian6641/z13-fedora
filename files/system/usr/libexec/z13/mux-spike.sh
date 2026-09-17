#!/usr/bin/env bash
# z13-mux — inspect (and optionally change) the ASUS GPU MUX on kernels where asus-armoury has
# replaced the legacy asus-wmi sysfs attribute.
#
# Background: /sys/devices/platform/asus-nb-wmi/gpu_mux_mode existed from kernel 6.1 and is now
# marked deprecated; Linux 6.19+ moves these knobs to the asus-armoury "fw_attributes" class
# (also home to ppt_pl1_spl / ppt_pl2_sppt). Fedora 44 runs kernel 7.2, so the legacy path may be
# gone. The exact armoury attribute name for the MUX is not documented publicly, which is why this
# script prints the full attribute inventory before changing anything.
#
# Usage:
#   z13-mux status                     report the current state (read-only, default)
#   z13-mux list                       dump every asus-armoury attribute
#   z13-mux set-dgpu                   switch the MUX to dGPU-only (needs sudo, then a reboot)
#   z13-mux set-hybrid                 switch the MUX back to Optimus/hybrid (needs sudo + reboot)
#   z13-mux write <attribute> <value>  escape hatch for the spike: write a specific attribute
#
# Nothing here is required for day-to-day use: hybrid mode is the supported default.

set -uo pipefail

ATTR_DIR=/sys/class/fw_attributes
LEGACY=/sys/devices/platform/asus-nb-wmi/gpu_mux_mode

rd() { [[ -r "$1" ]] && cat "$1" 2>/dev/null; }

legacy_state() {
  local v
  v=$(rd "$LEGACY") || return 1
  [[ -n "$v" ]] || return 1
  case "$v" in
    0) printf '0 (dGPU-only / Ultimate mode)\n' ;;
    1) printf '1 (Optimus / hybrid — panel on the iGPU)\n' ;;
    *) printf '%s (unexpected value)\n' "$v" ;;
  esac
}

list_attrs() {
  if [[ ! -d "$ATTR_DIR" ]]; then
    printf 'asus-armoury is not present: %s does not exist.\n' "$ATTR_DIR"
    return 1
  fi
  shopt -s nullglob
  local found=0
  for d in "$ATTR_DIR"/*/; do
    found=1
    local name; name=$(basename "$d")
    printf '  %-28s current=%-10s possible=%-18s type=%s\n' \
      "$name" \
      "$(rd "$d/current_value" || echo '?')" \
      "$(rd "$d/possible_values" || echo '?')" \
      "$(rd "$d/type" || echo '?')"
  done
  (( found )) || printf '  (no attributes found under %s)\n' "$ATTR_DIR"
}

find_mux_attr() {
  shopt -s nullglob
  for d in "$ATTR_DIR"/*/; do
    local name; name=$(basename "$d")
    case "$name" in
      *mux*) printf '%s\n' "$name"; return 0 ;;
    esac
  done
  # fall back to any gpu-ish attribute that advertises two possible values
  for d in "$ATTR_DIR"/*/; do
    local name; name=$(basename "$d")
    case "$name" in
      *gpu*)
        local vals; vals=$(rd "$d/possible_values" || true)
        [[ "$vals" == *0* && "$vals" == *1* ]] && { printf '%s\n' "$name"; return 0; }
        ;;
    esac
  done
  return 1
}

set_mux() {
  local want="$1"  # 0 = dGPU-only, 1 = hybrid
  local legacy
  if legacy=$(legacy_state); then
    printf 'Legacy attribute present (%s). Writing %s to %s\n' "$legacy" "$want" "$LEGACY"
    printf '%s\n' "$want" | sudo tee "$LEGACY" >/dev/null && printf 'Written. A reboot is required for the MUX change to take effect.\n'
    return $?
  fi
  local attr
  if ! attr=$(find_mux_attr); then
    printf 'No MUX attribute found.\n\nFull armoury inventory:\n' >&2
    list_attrs >&2 || true
    printf '\nTrack B (dGPU Waydroid) needs the MUX in dGPU-only mode; without a writable attribute\n' >&2
    printf 'this is blocked on this kernel. Record the inventory above in the project notes.\n' >&2
    return 1
  fi
  printf 'Using armoury attribute "%s" (current: %s, possible: %s)\n' \
    "$attr" "$(rd "$ATTR_DIR/$attr/current_value" || echo '?')" "$(rd "$ATTR_DIR/$attr/possible_values" || echo '?')"
  printf '%s\n' "$want" | sudo tee "$ATTR_DIR/$attr/current_value" >/dev/null \
    && printf 'Written. A reboot is required for the MUX change to take effect.\n'
}

case "${1:-status}" in
  status)
    printf '== MUX status\n'
    if state=$(legacy_state); then
      printf '  legacy gpu_mux_mode: %s\n' "$state"
    else
      printf '  legacy gpu_mux_mode: absent (expected on kernel >= 6.19)\n'
    fi
    if [[ -d "$ATTR_DIR" ]]; then
      if attr=$(find_mux_attr); then
        printf '  armoury attribute:   %s = %s (possible: %s)\n' \
          "$attr" "$(rd "$ATTR_DIR/$attr/current_value" || echo '?')" "$(rd "$ATTR_DIR/$attr/possible_values" || echo '?')"
      else
        printf '  armoury attribute:   no mux-like attribute found — run "z13-mux list" and record the inventory\n'
      fi
    else
      printf '  armoury:             %s not present\n' "$ATTR_DIR"
    fi
    printf '\n  dgpu_disable: %s   (1 = dGPU powered off; a different knob from the MUX)\n' \
      "$(rd /sys/devices/platform/asus-nb-wmi/dgpu_disable || echo 'absent')"
    printf '  panel is driven by: %s\n' \
      "$(if [[ "$(rd "$LEGACY" || echo 1)" == "0" ]]; then echo 'the NVIDIA GPU (MUX in dGPU mode)'; else echo 'the Intel iGPU (hybrid)'; fi)"
    ;;
  list)   list_attrs ;;
  set-dgpu)   set_mux 0 ;;
  set-hybrid) set_mux 1 ;;
  write)
    [[ $# -eq 3 ]] || { printf 'usage: z13-mux write <attribute> <value>\n' >&2; exit 2; }
    [[ -d "$ATTR_DIR/$2" ]] || { printf 'no such attribute: %s\n' "$2" >&2; exit 1; }
    printf '%s\n' "$3" | sudo tee "$ATTR_DIR/$2/current_value" >/dev/null && printf 'Written %s=%s (reboot may be required)\n' "$2" "$3"
    ;;
  -h|--help) sed -n '2,20p' "$0" ;;
  *) printf 'unknown action: %s (try -h)\n' "$1" >&2; exit 2 ;;
esac
