# Z13 Fedora — device-specific ujust recipes.
# Installed to /usr/share/ublue-os/just/99-z13.just; `ujust --choose` lists them.
# Every recipe is a thin wrapper around a script in /usr/libexec/z13/ so the logic can be run,
# read and tested directly.

# Print the hardware/feature status report for this machine
z13-status:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/verify.sh --quick

# Run the full acceptance checklist (pass --suspend to also test one suspend/resume cycle)
z13-verify *args:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/verify.sh "$@"

# Post-install setup: asusd/tuned hand-off, MUX report, fingerprint, next steps
z13-oobe:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/oobe.sh

# Initialize or refresh Waydroid with the official Android 13 GAPPS channel (flags: --force, --atv)
z13-waydroid-setup *args:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/waydroid-setup.sh "$@"

# Wipe Android state and re-init from the baked images (needed after an image update changes
# the baked channel - Android data from a different OS version cannot be reused)
z13-waydroid-reset:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "stopping Waydroid and wiping /var/lib/waydroid (Android apps + data are lost)"
    sudo systemctl stop waydroid-container.service 2>/dev/null || true
    waydroid session stop 2>/dev/null || true
    sudo rm -rf /var/lib/waydroid
    sudo systemctl start z13-waydroid-init.service
    echo "re-initialized from the baked images; start with the Waydroid icon"

# Report the ASUS MUX state and the asus-armoury attribute inventory (read-only)
z13-mux:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/mux-spike.sh status

# On-screen keyboard toggle: "off" while the folio keyboard is attached, "on" for tablet use
z13-osk mode="status":
    exec /usr/libexec/z13/osk.sh {{mode}}

# Show which GPU the compositor, the NVIDIA stack and Waydroid are using
z13-gpu:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/gpu-status.sh

# Install or refresh the on-disk recovery environment on the RECOVERY partition
# (pass an ISO path, or --latest to fetch the newest release ISO)
z13-recovery-install *args:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/recovery-install.sh "$@"

# Report the state of the on-disk recovery environment (reads only)
z13-recovery-status:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/recovery-install.sh --status

# Collect every acceptance check into one paste-ready block (pass --fast to skip slow probes)
z13-report *args:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/report.sh "$@"
