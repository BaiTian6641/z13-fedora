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

# Initialize or refresh Waydroid with Android 16 QPR2 GAPPS images (flags: --force, --stock)
z13-waydroid-setup *args:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/waydroid-setup.sh "$@"

# Report the ASUS MUX state and the asus-armoury attribute inventory (read-only)
z13-mux:
    #!/usr/bin/env bash
    set -uo pipefail
    exec /usr/libexec/z13/mux-spike.sh status

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
