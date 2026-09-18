#!/usr/bin/env bash
# z13-apps-ensure - converge the flatpak app set at first boot, whatever the installer did.
#
# The apps are baked into the image at /usr/share/z13/flatpak (a complete flatpak system-dir:
# repo, deployed apps, exports, flathub remote config). /var cannot carry baked content because
# BlueBuild's post_build.sh wipes it at image-build time, so the tree is materialized here at
# first boot. Idempotent; safe to run any time. Logs: journalctl -u z13-apps-ensure.service.
set -uo pipefail

say() { printf 'z13-apps-ensure: %s\n' "$*"; }

STAGE=/usr/share/z13/flatpak
DEST=/var/lib/flatpak
APPS="org.onlyoffice.desktopeditors com.visualstudio.code com.valvesoftware.Steam com.vysp3r.ProtonPlus org.videolan.VLC org.chromium.Chromium org.kde.krita com.github.flxzt.rnote com.github.xournalpp.xournalpp org.gnome.Loupe"

# 1) Materialize the staged system-dir. cp -a preserves the ostree repo's xattrs; reflink makes
#    it near-instant on xfs/btrfs. restorecon repairs the build-time container_file_t labels.
if [ -d "$STAGE/app" ]; then
  if [ ! -d "$DEST/app" ]; then
    say "materializing baked flatpaks from $STAGE"
    mkdir -p "$DEST"
    cp -a --reflink=auto "$STAGE/." "$DEST/" || say "copy had errors (continuing with what landed)"
  else
    say "system flatpak dir already populated"
  fi
fi

if [ -d "$DEST" ]; then
  restorecon -R "$DEST" 2>/dev/null || say "restorecon not available or failed (continuing)"
fi

# 2) Top up anything missing (e.g. VS Code, which cannot be baked - extra-data needs a user
#    namespace at install time, available here on the real machine).
if ! flatpak remote-list --system --columns=name 2>/dev/null | grep -qx flathub; then
  say "adding flathub remote"
  flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo || say "remote-add failed (offline?)"
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
