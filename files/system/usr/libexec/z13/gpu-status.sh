#!/usr/bin/env bash
# z13-gpu — which GPU is doing what, right now, on the Flow Z13 (hybrid Iris Xe + RTX 3050).
#
# The interesting question on this machine: is the Plasma compositor on the iGPU (intended) or has
# it wandered onto the dGPU (KDE bug 521914 territory — see the session guard
# /etc/xdg/plasma-workspace/env/z13-guards.sh)?

set -uo pipefail

have() { command -v "$1" >/dev/null 2>&1; }
section() { printf '\n== %s\n' "$*"; }

# nvidia-smi writes query errors to stdout and still exits non-zero, so every value is validated.
gpu_query() {
  local out
  out=$(nvidia-smi --query-gpu="$1" --format=csv,noheader 2>/dev/null | head -1 | tr -d '\r')
  case "$out" in
    ""|*"not a valid field"*|*"Field "*|*"failed"*|*"Unable to determine"*) return 1 ;;
  esac
  printf '%s\n' "$out"
}
gpu_procs() {
  nvidia-smi --query-compute-apps=pid,process_name,used_memory --format=csv,noheader 2>/dev/null \
    | grep -v 'not a valid field' || true
}

section "Kernel drivers in use"
if lsmod 2>/dev/null | grep -qE '^nvidia'; then
  printf '  nvidia: loaded (%s module(s))\n' "$(lsmod | grep -cE '^nvidia')"
else
  printf '  nvidia: not loaded — the dGPU is not available as a renderer\n'
fi
if lsmod 2>/dev/null | grep -qE '^i915'; then
  printf '  i915:   loaded (Intel iGPU)\n'
else
  printf '  i915:   NOT loaded — unexpected on this platform\n'
fi

section "NVIDIA"
if have nvidia-smi; then
  if name=$(gpu_query name); then
    printf '  GPU:      %s\n' "$name"
    printf '  driver:   %s\n' "$(gpu_query driver_version || echo '?')"
    printf '  util:     %s\n' "$(gpu_query utilization.gpu || echo '?')"
    printf '  mem used: %s\n' "$(gpu_query memory.used || echo '?')"
    printf '  power:    %s\n' "$(gpu_query power.draw || echo 'n/a')"
    printf '  p-state:  %s\n' "$(gpu_query power.state || echo 'n/a on this driver')"
  else
    printf '  nvidia-smi present but no GPU could be queried (kernel modules / driver problem)\n'
  fi
  printf '\n  processes holding the dGPU (kwin_wayland here = compositor on NVIDIA):\n'
  procs=$(gpu_procs)
  if [[ -n "$procs" ]]; then printf '%s\n' "$procs" | sed 's/^/    /'; else printf '    (none)\n'; fi
else
  printf '  nvidia-smi not installed\n'
fi

section "Intel iGPU (video acceleration + Vulkan)"
if have vainfo; then
  vainfo 2>/dev/null | grep -E 'Driver version|vainfo: Driver|VAProfileH264High' | sed 's/^/  /'
else
  printf '  vainfo not installed (libva-utils)\n'
fi
if have vulkaninfo; then
  vulkaninfo --summary 2>/dev/null | awk '/^GPU[0-9]+:/{print "  " $0} /deviceName|driverName|driverInfo/{print "    " $0}' | head -20
else
  printf '  vulkaninfo not installed (vulkan-tools)\n'
fi

section "Waydroid rendering"
if have waydroid; then
  if timeout 10 waydroid status 2>/dev/null | grep -q RUNNING; then
    renderer=$(sudo waydroid shell dumpsys SurfaceFlinger 2>/dev/null | grep -m1 GLES || true)
    printf '  %s\n' "${renderer:-GLES line not found}"
    printf '  (expected: Mesa on the Intel iGPU; NVIDIA is refused by Waydroid by design)\n'
  else
    printf '  waydroid session is not running\n'
  fi
else
  printf '  waydroid not installed\n'
fi

section "Session guard"
conf=/etc/xdg/plasma-workspace/env/z13-guards.sh
if [[ -r "$conf" ]] && grep -qE '^[[:space:]]*export[[:space:]]+KWIN_DISABLE_VULKAN=1' "$conf"; then
  printf '  KWIN_DISABLE_VULKAN=1 is set in %s\n' "$conf"
  printf '  (log out and back in after changing it; see PLAN.md §7.2)\n'
else
  printf '  KWIN_DISABLE_VULKAN is not set in %s\n' "$conf"
fi
