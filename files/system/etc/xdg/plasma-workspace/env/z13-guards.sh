# z13-guards.sh — Plasma session environment guards for the ASUS ROG Flow Z13 (2022, GZ301ZC).
# startplasma sources <config-dirs>/plasma-workspace/env/*.sh, so everything here lands in the
# Plasma session environment.
#
# KWIN_DISABLE_VULKAN=1
#   Plasma 6.7 lets kwin_wayland pick its renderer via Vulkan; on this hybrid laptop that can put
#   the compositor on the dGPU (KDE bug 521914), costing battery and adding idle heat. With the
#   variable set, KWin stays on OpenGL and the panel's iGPU.
#   Verify with `ujust z13-gpu` — while the desktop is idle, nvidia-smi should NOT list
#   kwin_wayland. If it does not, delete this line (or this file) and re-check.
export KWIN_DISABLE_VULKAN=1

# Optional, deliberately off:
#   KWIN_IM_SHOW_ALWAYS=1   force the on-screen keyboard regardless of input-method focus
#                           (useful if Plasma 6.7's tablet-mode OSK detection misbehaves)
#   KWIN_WAYLAND_EMULATE_TABLET=1   let apps without tablet support receive pen input as a pointer
# export KWIN_WAYLAND_EMULATE_TABLET=1
