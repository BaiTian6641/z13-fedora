#!/usr/bin/env bash
# z13-apps-ensure - converge the flatpak app set at first boot, whatever the installer did.
#
# The apps are baked into the image at /var/lib/flatpak. Two known ways that can fail to show up:
#   1. SELinux labels: content written at image-build time carries container_file_t; flatpak then
#      cannot read its own repo on the deployed system -> restorecon fixes it.
#   2. Carry-over gaps: if an installer ever skips baked /var content, reinstall missing apps.
# Idempotent; safe to run any time. Logs to the journal (journalctl -u z13-apps-ensure.service).
set -uo pipefail

say() { printf 'z13-apps-ensure: %s\n' "$*"; }

APPS="org.onlyoffice.desktopeditors com.visualstudio.code com.valvesoftware.Steam com.vysp3r.ProtonPlus org.videolan.VLC org.chromium.Chromium org.kde.krita com.github.flxzt.rnote com.github.xournalpp.xournalpp org.gnome.Loupe"

if [ -d /var/lib/flatpak ]; then
  say "restorecon on /var/lib/flatpak (fixes build-time container_file_t labels)"
  restorecon -R /var/lib/flatpak 2>/dev/null || say "restorecon not available or failed (continuing)"
fi

if ! flatpak remote-list --system --columns=name 2>/dev/null | grep -qx flathub; then
  say "adding flathub remote"
  flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || say "remote-add failed (offline? will retry next boot)"
fi

missing=""
for app in $APPS; do
  flatpak info --system "$app" >/dev/null 2>&1 || missing="$missing $app"
done

if [ -n "$missing" ]; then
  say "installing missing apps:$missing"
  # shellcheck disable=SC2086
  flatpak install -y --system --noninteractive flathub $missing || say "install failed (will retry next boot)"
else
  say "all apps present"
fi

say "installed system apps: $(flatpak list --system --app --columns=application 2>/dev/null | wc -l)"
