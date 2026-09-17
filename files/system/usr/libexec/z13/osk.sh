#!/usr/bin/env bash
# z13-osk - toggle Plasma's on-screen keyboard.
#
# Usage: z13-osk on|off|status
#
# "off" is the right default when the folio keyboard is attached (a pop-up OSK covers half the
# 13.4" panel in desktop mode); "on" restores Plasma's own default, which shows the keyboard for
# touch input on tablets. The oobe applies "off" automatically when a hardware keyboard is present.

set -uo pipefail

state() {
  v=$(kreadconfig6 --file kwinrc --group Wayland --key InputMethod 2>/dev/null || true)
  if [[ -z "${v}" ]]; then echo "auto (Plasma default)"; elif [[ "${v}" == none ]]; then echo "off"; else echo "${v}"; fi
}

case "${1:-status}" in
  on)
    kwriteconfig6 --file kwinrc --group Wayland --key InputMethod --delete 2>/dev/null || true
    echo "on-screen keyboard: auto (Plasma default). Log out/in or restart KWin to apply."
    ;;
  off)
    kwriteconfig6 --file kwinrc --group Wayland --key InputMethod none
    echo "on-screen keyboard: off. Log out/in or restart KWin to apply."
    ;;
  status) echo "on-screen keyboard: $(state)" ;;
  *) echo "usage: z13-osk on|off|status" >&2; exit 2 ;;
esac
