# Last publish failure

Run: https://github.com/BaiTian6641/z13-fedora/actions/runs/38139072306
Commit: 89d4b22a426767d11aff62d95ce66ae367f711e7

```
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.86 [27/41] Installing egl-wayland2-0:1.0.2 100% |  20.1 MiB/s | 102.9 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.87 [28/41] Installing egl-gbm-2:1.1.4-3.fc 100% |   7.3 MiB/s |  29.7 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.87 [29/41] Installing libvdpau-0:1.5-11.fc 100% |   3.5 MiB/s |  21.5 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.88 [30/41] Installing libglvnd-opengl-1:1. 100% |  31.4 MiB/s | 128.7 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.89 [31/41] Installing libglvnd-gles-1:1.7. 100% |  11.9 MiB/s |  85.5 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.91 [32/41] Installing nvidia-settings-3:61 100% |  55.5 MiB/s |   1.6 MiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.94 [33/41] Installing nvidia-xconfig-3:615 100% |  11.2 MiB/s | 195.4 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 88.95 [34/41] Installing nvidia-driver-cuda-3 100% |  71.6 MiB/s |   1.8 MiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.05 [35/41] Installing nvidia-container-too 100% |  49.1 MiB/s |   5.0 MiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.08 [36/41] Installing libnvidia-fbc-3:615. 100% |  57.3 MiB/s | 352.2 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.12 [37/41] Installing supergfxctl-0:5.2.7- 100% | 104.7 MiB/s |   5.5 MiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.12 [38/41] Installing libva-nvidia-driver- 100% |  41.0 MiB/s | 168.0 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.16 [39/41] Installing egl-wayland-0:1.1.23 100% |  12.4 MiB/s |  89.0 KiB |  00m00s
[12:28:45 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 89.33 [40/41] Installing nvidia-driver-libs-3 100% | 387.3 MiB/s |  77.1 MiB |  00m00s
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.26 [41/41] Installing libnvidia-fbc-3:615. 100% | 156.5 KiB/s | 458.7 KiB |  00m03s
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.26 Warning: skipped OpenPGP checks for 18 packages from repository: @commandline
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.26 Complete!
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.27 ++ rpm -q --queryformat '%{VERSION}' kmod-nvidia
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.28 + KMOD_VERSION=615.78.08
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.28 ++ rpm -q --queryformat '%{VERSION}' nvidia-driver
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.30 + DRIVER_VERSION=615.78.08
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.30 + '[' 615.78.08 '!=' 615.78.08 ']'
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.30 + dnf5 config-manager setopt 'fedora-nvidia*.enabled=0' nvidia-container-toolkit.enabled=0
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.33 + dnf5 config-manager setopt copr:copr.fedorainfracloud.org:ublue-os:staging.enabled=0
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.36 + systemctl enable nvidia-cdi-refresh.service nvidia-cdi-refresh.path nvidia-persistenced.service
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.37 Created symlink '/etc/systemd/system/multi-user.target.wants/nvidia-persistenced.service' → '/usr/lib/systemd/system/nvidia-persistenced.service'.
[12:28:48 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 92.37 + semodule --verbose --install /usr/share/selinux/packages/nvidia-container.pp
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.52 Attempting to install module '/usr/share/selinux/packages/nvidia-container.pp':
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.52 Ok: return value of 0.
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.52 Committing changes:
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.52 Ok: transaction number 22.
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.53 + sed -i s@omit_drivers@force_drivers@g /usr/lib/dracut/dracut.conf.d/99-nvidia.conf
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.54 + sed -i 's@ nvidia @ i915 amdgpu nvidia @g' /usr/lib/dracut/dracut.conf.d/99-nvidia.conf
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.54 + [[ Y = Y ]]
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.54 + dnf5 config-manager setopt fedora-multimedia.enabled=1
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 98.58 [32m============================= End 'akmods' Module =============================[0m
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #57 DONE 98.6s
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 [stage-5 11/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"packages":["waydroid","waydroid-selinux"]}}'
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 0.104 [33m============================== Start 'dnf' Module ==============================[0m
[12:28:54 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 0.204 Updating and loading repositories:
[12:28:55 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.275  ZeroTier, Inc. RPM Release Repository  100% |   6.7 KiB/s |   3.0 KiB |  00m00s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.275  Fedora 44 - x86_64 - Updates Archive   100% |   7.5 KiB/s |   3.4 KiB |  00m00s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.276  Fedora 44 - x86_64 - Updates           100% |  26.5 KiB/s |  24.0 KiB |  00m01s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.277  negativo17 - Multimedia                100% |   9.5 KiB/s |   4.3 KiB |  00m00s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.277  Fedora 44 - x86_64                     100% |  26.6 KiB/s |  24.1 KiB |  00m01s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.277  Copr repo for akmods owned by ublue-os 100% |   4.4 KiB/s |   1.5 KiB |  00m00s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.277  Copr repo for asus-linux owned by luke 100% |   4.8 KiB/s |   1.5 KiB |  00m00s
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.918 Repositories loaded.
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.918 Metadata cache created.
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.933 [32mInstalling packages:[0m
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.935 - [36mwaydroid[0m
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.937 - [36mwaydroid-selinux[0m
[12:28:56 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 1.982 Updating and loading repositories:
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 2.541 Repositories loaded.
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 Package           Arch   Version         Repository      Size
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 Installing:
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  waydroid         noarch 0:1.6.3-1.fc44  updates    692.7 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  waydroid-selinux noarch 0:1.6.3-1.fc44  updates    145.9 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 Installing dependencies:
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  libgbinder       x86_64 0:1.1.47-1.fc44 updates    164.4 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  libglibutil      x86_64 0:1.0.82-1.fc44 updates     86.2 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  lxc              x86_64 0:6.0.6-1.fc44  fedora       1.3 MiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  lxc-libs         x86_64 0:6.0.6-1.fc44  fedora       2.5 MiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  lxc-templates    x86_64 0:6.0.6-1.fc44  fedora      48.6 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  lxcfs            x86_64 0:6.0.6-1.fc44  fedora     230.6 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  python3-gbinder  x86_64 0:1.3.0-2.fc44  fedora     474.9 KiB
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 Transaction Summary:
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003  Installing:         9 packages
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 Total size of inbound packages is 2 MiB. Need to download 2 MiB.
[12:28:57 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 3.003 After this operation, 6 MiB extra will be used (install 6 MiB, remove 0 B).
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 4.419 [1/9] waydroid-0:1.6.3-1.fc44.noarch    100% | 741.7 KiB/s | 365.7 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 4.538 [2/9] python3-gbinder-0:1.3.0-2.fc44.x8 100% | 274.0 KiB/s | 167.7 KiB |  00m01s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 4.781 [3/9] lxc-0:6.0.6-1.fc44.x86_64         100% | 430.8 KiB/s | 368.3 KiB |  00m01s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 4.885 [4/9] lxcfs-0:6.0.6-1.fc44.x86_64       100% | 284.5 KiB/s |  98.4 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 4.945 [5/9] waydroid-selinux-0:1.6.3-1.fc44.n 100% | 473.5 KiB/s |  27.9 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.011 [6/9] libgbinder-0:1.1.47-1.fc44.x86_64 100% |   1.1 MiB/s |  71.7 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.076 [7/9] libglibutil-0:1.0.82-1.fc44.x86_6 100% | 636.3 KiB/s |  40.7 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.080 [8/9] lxc-libs-0:6.0.6-1.fc44.x86_64    100% |   1.6 MiB/s |   1.0 MiB |  00m01s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.080 [9/9] lxc-templates-0:6.0.6-1.fc44.x86_ 100% |  71.6 KiB/s |  21.4 KiB |  00m00s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.080 --------------------------------------------------------------------------------
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.080 [9/9] Total                             100% |   1.0 MiB/s |   2.2 MiB |  00m02s
[12:28:59 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.082 Running transaction
[12:29:00 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 5.925 [ 1/11] Verify package files            100% |   1.1 KiB/s |   9.0   B |  00m00s
[12:29:00 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.096 [ 2/11] Prepare transaction             100% |  24.0   B/s |   9.0   B |  00m00s
[12:29:00 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.198 [ 3/11] Installing lxc-libs-0:6.0.6-1.f 100% |  25.3 MiB/s |   2.6 MiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.207 [ 4/11] Installing lxc-templates-0:6.0. 100% |  16.4 MiB/s |  50.3 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.307 [ 5/11] Installing lxcfs-0:6.0.6-1.fc44 100% |   5.6 MiB/s | 233.4 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.335 [ 6/11] Installing lxc-0:6.0.6-1.fc44.x 100% |  14.8 MiB/s |   1.3 MiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.343 [ 7/11] Installing libglibutil-0:1.0.82 100% |  10.7 MiB/s |  87.5 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.349 [ 8/11] Installing libgbinder-0:1.1.47- 100% |  23.1 MiB/s | 165.7 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.377 [ 9/11] Installing python3-gbinder-0:1. 100% |  77.6 MiB/s | 476.9 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 [10/11] Installing waydroid-0:1.6.3-1.f 100% |   2.5 MiB/s | 721.7 KiB |  00m00s
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 >>> Running %post scriptlet: waydroid-0:1.6.3-1.fc44.noarch
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 >>> Finished %post scriptlet: waydroid-0:1.6.3-1.fc44.noarch
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 >>> Scriptlet output:
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 >>> Created symlink '/etc/systemd/system/multi-user.target.wants/waydroid-container.service' → '/usr/lib/systemd/system/waydroid-container.service'.
[12:29:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 6.634 >>> 
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 [11/11] Installing waydroid-selinux-0:1 100% |  11.1 KiB/s | 146.4 KiB |  00m13s
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 >>> Running %post scriptlet: waydroid-selinux-0:1.6.3-1.fc44.noarch
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 >>> Finished %post scriptlet: waydroid-selinux-0:1.6.3-1.fc44.noarch
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 >>> Scriptlet output:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 >>> libsemanage.semanage_rename: WARNING: rename(/etc/selinux/targeted/active, /etc/selinux/targeted/previous) failed: Invalid cross-device link, fall back to non-atomic semanage_copy_dir_flags()
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 >>> 
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.81 Complete!
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 19.83 [32m=============================== End 'dnf' Module ===============================[0m
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #58 DONE 19.9s
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 [stage-5 12/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/script:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'script' '{"type":"script","snippets":["set -euo pipefail\n# Bake the Android images. Manifests per upstream initializer.py URL composition:\n#   system: \u003cchannel\u003e/\u003crom\u003e/waydroid_\u003carch\u003e/\u003csystem_type\u003e.json\n#   vendor: \u003cchannel\u003e/waydroid_\u003carch\u003e/\u003cvendor_type\u003e.json      (MAINLINE on bare x86_64)\n# sha256 is verified against the manifest\u0027s \"id\" before anything lands in the image.\nmkdir -p /usr/share/waydroid-extra/images\npython3 - \u003c\u003c\u0027BAKE\u0027\nimport hashlib, json, os, sys, urllib.request, zipfile\n\nDEST = \"/usr/share/waydroid-extra/images\"\nMANIFESTS = [\n    (\"https://ota.waydro.id/system/lineage/waydroid_x86_64/GAPPS.json\", \"system.img\"),\n    (\"https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json\", \"vendor.img\"),\n]\nUA = {\"User-Agent\": \"bluebuild-z13/1.0\"}\nfor url, imgname in MANIFESTS:\n    with urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=60) as r:\n        m = json.load(r)[\"response\"][0]\n    zippath = \"/tmp/\" + m[\"filename\"]\n    print(f\"-\u003e {m[\u0027filename\u0027]} ({m[\u0027size\u0027]/1e9:.2f} GB, version {m[\u0027version\u0027]}, ASB {m.get(\u0027asb\u0027,\u0027?\u0027)})\", flush=True)\n    with urllib.request.urlopen(urllib.request.Request(m[\"url\"], headers=UA), timeout=600) as r, open(zippath, \"wb\") as f:\n        for chunk in iter(lambda: r.read(1 \u003c\u003c 24), b\"\"):\n            f.write(chunk)\n    h = hashlib.sha256()\n    with open(zippath, \"rb\") as f:\n        for chunk in iter(lambda: f.read(1 \u003c\u003c 24), b\"\"):\n            h.update(chunk)\n    if h.hexdigest() != m[\"id\"]:\n        sys.exit(f\"sha256 mismatch for {m[\u0027filename\u0027]}: {h.hexdigest()} != {m[\u0027id\u0027]}\")\n    with zipfile.ZipFile(zippath) as z:\n        src = imgname if imgname in z.namelist() else z.namelist()[0]\n        with z.open(src) as f, open(os.path.join(DEST, imgname), \"wb\") as out:\n            for chunk in iter(lambda: f.read(1 \u003c\u003c 24), b\"\"):\n                out.write(chunk)\n    os.remove(zippath)\n    print(f\"   baked {imgname} (sha256 verified)\", flush=True)\nBAKE\nls -lh /usr/share/waydroid-extra/images/\n"]}'
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.096 [33m============================ Start 'script' Module ============================[0m
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 [32mRunning snippet:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 [36mset -euo pipefail
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 # Bake the Android images. Manifests per upstream initializer.py URL composition:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 #   system: <channel>/<rom>/waydroid_<arch>/<system_type>.json
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 #   vendor: <channel>/waydroid_<arch>/<vendor_type>.json      (MAINLINE on bare x86_64)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 # sha256 is verified against the manifest's "id" before anything lands in the image.
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 mkdir -p /usr/share/waydroid-extra/images
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 python3 - <<'BAKE'
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 import hashlib, json, os, sys, urllib.request, zipfile
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 DEST = "/usr/share/waydroid-extra/images"
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 MANIFESTS = [
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     ("https://ota.waydro.id/system/lineage/waydroid_x86_64/GAPPS.json", "system.img"),
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     ("https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json", "vendor.img"),
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 ]
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 UA = {"User-Agent": "bluebuild-z13/1.0"}
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 for url, imgname in MANIFESTS:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     with urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=60) as r:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         m = json.load(r)["response"][0]
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     zippath = "/tmp/" + m["filename"]
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     print(f"-> {m['filename']} ({m['size']/1e9:.2f} GB, version {m['version']}, ASB {m.get('asb','?')})", flush=True)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     with urllib.request.urlopen(urllib.request.Request(m["url"], headers=UA), timeout=600) as r, open(zippath, "wb") as f:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         for chunk in iter(lambda: r.read(1 << 24), b""):
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126             f.write(chunk)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     h = hashlib.sha256()
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     with open(zippath, "rb") as f:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         for chunk in iter(lambda: f.read(1 << 24), b""):
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126             h.update(chunk)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     if h.hexdigest() != m["id"]:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         sys.exit(f"sha256 mismatch for {m['filename']}: {h.hexdigest()} != {m['id']}")
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     with zipfile.ZipFile(zippath) as z:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         src = imgname if imgname in z.namelist() else z.namelist()[0]
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126         with z.open(src) as f, open(os.path.join(DEST, imgname), "wb") as out:
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126             for chunk in iter(lambda: f.read(1 << 24), b""):
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126                 out.write(chunk)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     os.remove(zippath)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126     print(f"   baked {imgname} (sha256 verified)", flush=True)
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 BAKE
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 ls -lh /usr/share/waydroid-extra/images/
[12:29:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.126 [0m
[12:29:15 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 0.592 -> lineage-20.0-20260927-GAPPS-waydroid_x86_64-system.zip (1.19 GB, version 20.0, ASB ?)
[12:29:53 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 39.00    baked system.img (sha256 verified)
[12:29:53 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 39.28 -> lineage-20.0-20260927-MAINLINE-waydroid_x86_64-vendor.zip (0.19 GB, version 20.0, ASB ?)
[12:30:00 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.35    baked vendor.img (sha256 verified)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.58 total 3.0G
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.58 -rw-r--r-- 1 root root 2.5G Oct 11 12:29 system.img
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.58 -rw-r--r-- 1 root root 537M Oct 11 12:30 vendor.img
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 [32mFinished running snippet:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 [36mset -euo pipefail
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 # Bake the Android images. Manifests per upstream initializer.py URL composition:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 #   system: <channel>/<rom>/waydroid_<arch>/<system_type>.json
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 #   vendor: <channel>/waydroid_<arch>/<vendor_type>.json      (MAINLINE on bare x86_64)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 # sha256 is verified against the manifest's "id" before anything lands in the image.
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 mkdir -p /usr/share/waydroid-extra/images
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 python3 - <<'BAKE'
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 import hashlib, json, os, sys, urllib.request, zipfile
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 DEST = "/usr/share/waydroid-extra/images"
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 MANIFESTS = [
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     ("https://ota.waydro.id/system/lineage/waydroid_x86_64/GAPPS.json", "system.img"),
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     ("https://ota.waydro.id/vendor/waydroid_x86_64/MAINLINE.json", "vendor.img"),
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 ]
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 UA = {"User-Agent": "bluebuild-z13/1.0"}
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 for url, imgname in MANIFESTS:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     with urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=60) as r:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         m = json.load(r)["response"][0]
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     zippath = "/tmp/" + m["filename"]
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     print(f"-> {m['filename']} ({m['size']/1e9:.2f} GB, version {m['version']}, ASB {m.get('asb','?')})", flush=True)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     with urllib.request.urlopen(urllib.request.Request(m["url"], headers=UA), timeout=600) as r, open(zippath, "wb") as f:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         for chunk in iter(lambda: r.read(1 << 24), b""):
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63             f.write(chunk)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     h = hashlib.sha256()
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     with open(zippath, "rb") as f:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         for chunk in iter(lambda: f.read(1 << 24), b""):
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63             h.update(chunk)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     if h.hexdigest() != m["id"]:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         sys.exit(f"sha256 mismatch for {m['filename']}: {h.hexdigest()} != {m['id']}")
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     with zipfile.ZipFile(zippath) as z:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         src = imgname if imgname in z.namelist() else z.namelist()[0]
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63         with z.open(src) as f, open(os.path.join(DEST, imgname), "wb") as out:
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63             for chunk in iter(lambda: f.read(1 << 24), b""):
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63                 out.write(chunk)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     os.remove(zippath)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63     print(f"   baked {imgname} (sha256 verified)", flush=True)
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 BAKE
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 ls -lh /usr/share/waydroid-extra/images/
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 [0m
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.63 [32mDone[0m
[12:30:01 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 46.64 [32m============================= End 'script' Module =============================[0m
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #59 DONE 49.7s
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #60 [stage-5 13/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/systemd:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'systemd' '{"type":"systemd","system":{"enabled":["z13-waydroid-init.service"]}}'
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #60 0.086 [33m============================ Start 'systemd' Module ============================[0m
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #60 0.122 Created symlink '/etc/systemd/system/multi-user.target.wants/z13-waydroid-init.service' → '/usr/lib/systemd/system/z13-waydroid-init.service'.
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #60 0.126 [32m============================= End 'systemd' Module =============================[0m
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #60 DONE 0.1s
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 [stage-5 14/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"packages":["plasma-keyboard","mesa-demos","libva-utils","vulkan-tools","iio-sensor-proxy","alsa-utils","pciutils","usbutils","btop","ksystemlog","brightnessctl","fprintd","wireguard-tools","tailscale","zerotier-one","google-carlito-fonts","google-crosextra-caladea-fonts","google-arimo-fonts","liberation-sans-fonts","liberation-serif-fonts","tuned","tuned-ppd"]}}'
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 0.073 [33m============================== Start 'dnf' Module ==============================[0m
[12:30:04 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 0.184 Updating and loading repositories:
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  ZeroTier, Inc. RPM Release Repository  100% |   6.8 KiB/s |   3.0 KiB |  00m00s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  Fedora 44 - x86_64 - Updates Archive   100% |   7.6 KiB/s |   3.4 KiB |  00m00s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  Fedora 44 - x86_64 - Updates           100% |  27.4 KiB/s |  24.0 KiB |  00m01s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  negativo17 - Multimedia                100% |   9.6 KiB/s |   4.3 KiB |  00m00s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  Fedora 44 - x86_64                     100% |  27.4 KiB/s |  24.1 KiB |  00m01s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.229  Copr repo for akmods owned by ublue-os 100% |   5.7 KiB/s |   1.5 KiB |  00m00s
[12:30:05 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.231  Copr repo for asus-linux owned by luke 100% |   5.9 KiB/s |   1.5 KiB |  00m00s
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.901 Metadata cache created.
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.901 Repositories loaded.
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.919 [32mInstalling packages:[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.921 - [36mplasma-keyboard[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.923 - [36mmesa-demos[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.924 - [36mlibva-utils[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.926 - [36mvulkan-tools[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.927 - [36miio-sensor-proxy[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.929 - [36malsa-utils[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.930 - [36mpciutils[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.932 - [36musbutils[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.933 - [36mbtop[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.935 - [36mksystemlog[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.936 - [36mbrightnessctl[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.938 - [36mfprintd[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.939 - [36mwireguard-tools[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.941 - [36mtailscale[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.943 - [36mzerotier-one[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.944 - [36mgoogle-carlito-fonts[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.946 - [36mgoogle-crosextra-caladea-fonts[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.948 - [36mgoogle-arimo-fonts[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.949 - [36mliberation-sans-fonts[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.951 - [36mliberation-serif-fonts[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.953 - [36mtuned[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 1.954 - [36mtuned-ppd[0m
[12:30:06 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 2.000 Updating and loading repositories:
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 2.769 Repositories loaded.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "plasma-keyboard-1:6.7.5-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "libva-utils-1:2.24.0-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "vulkan-tools-1.4.341.0-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "iio-sensor-proxy-3.8-2.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "alsa-utils-1.2.16-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "pciutils-3.15.0-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "usbutils-019-2.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "fprintd-1.94.5-5.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "wireguard-tools-1.0.20260223-1.fc44.x86_64" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "liberation-sans-fonts-1:2.1.5-15.fc44.noarch" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "liberation-serif-fonts-1:2.1.5-15.fc44.noarch" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "tuned-2.28.0-1.fc44.noarch" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 Package "tuned-ppd-2.28.0-1.fc44.noarch" is already installed.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.164 
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Package                         Arch   Version                    Repository      Size
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Changing reason:
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  alsa-utils                     x86_64 0:1.2.16-1.fc44            @System      2.3 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  fprintd                        x86_64 0:1.94.5-5.fc44            @System    829.1 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  iio-sensor-proxy               x86_64 0:3.8-2.fc44               @System    156.5 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  liberation-sans-fonts          noarch 1:2.1.5-15.fc44            @System      1.6 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  liberation-serif-fonts         noarch 1:2.1.5-15.fc44            @System      1.5 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  pciutils                       x86_64 0:3.15.0-1.fc44            @System    300.5 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  plasma-keyboard                x86_64 1:6.7.5-1.fc44             @System      1.6 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  tuned                          noarch 0:2.28.0-1.fc44            @System      1.7 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  tuned-ppd                      noarch 0:2.28.0-1.fc44            @System      7.0 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  usbutils                       x86_64 0:019-2.fc44               @System    327.5 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  vulkan-tools                   x86_64 0:1.4.341.0-1.fc44         @System      1.6 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166    External User -> User                                                              
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Installing:
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  brightnessctl                  x86_64 0:0.5.1-16.fc44            fedora      29.0 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  btop                           x86_64 0:1.4.7-1.fc44             updates      1.8 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  google-arimo-fonts             noarch 0:1.31.0-23.fc44           fedora       2.3 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  google-carlito-fonts           noarch 0:1.103-0.28.20130920.fc44 fedora       2.6 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  google-crosextra-caladea-fonts noarch 1:1.002-0.22.20130214.fc44 fedora     251.4 KiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  ksystemlog                     x86_64 0:26.08.1-1.fc44           updates      6.3 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  mesa-demos                     x86_64 0:9.0.0-11.fc44            fedora      24.0 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  tailscale                      x86_64 0:1.98.8-1.fc44            updates     48.9 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  zerotier-one                   x86_64 0:1.16.2-1.fc40            zerotier    10.7 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Installing weak dependencies:
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  rocm-smi                       x86_64 0:7.1.1-4.fc44             updates      2.7 MiB
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Transaction Summary:
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  Installing:        10 packages
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166  Changing reason:   11 packages
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 Total size of inbound packages is 27 MiB. Need to download 27 MiB.
[12:30:07 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 3.166 After this operation, 100 MiB extra will be used (install 100 MiB, remove 0 B).
[12:30:08 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 4.572 [ 1/10] brightnessctl-0:0.5.1-16.fc44.x 100% | 197.2 KiB/s |  21.7 KiB |  00m00s
[12:30:09 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 4.642 [ 2/10] google-crosextra-caladea-fonts- 100% |   1.4 MiB/s |  98.8 KiB |  00m00s
[12:30:09 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 4.751 [ 3/10] google-carlito-fonts-0:1.103-0. 100% |   2.7 MiB/s | 802.8 KiB |  00m00s
[12:30:09 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 4.784 [ 4/10] google-arimo-fonts-0:1.31.0-23. 100% |   6.5 MiB/s | 944.8 KiB |  00m00s
[12:30:09 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 4.812 [ 5/10] mesa-demos-0:9.0.0-11.fc44.x86_ 100% |  10.4 MiB/s |   3.7 MiB |  00m00s
[12:30:09 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 5.417 [ 6/10] btop-0:1.4.7-1.fc44.x86_64      100% | 982.3 KiB/s | 654.2 KiB |  00m01s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 5.672 [ 7/10] ksystemlog-0:26.08.1-1.fc44.x86 100% |   2.4 MiB/s |   2.1 MiB |  00m01s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 5.849 [ 8/10] rocm-smi-0:7.1.1-4.fc44.x86_64  100% |   3.3 MiB/s | 590.3 KiB |  00m00s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.128 [ 9/10] zerotier-one-0:1.16.2-1.fc40.x8 100% |   4.8 MiB/s |   3.4 MiB |  00m01s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.165 [10/10] tailscale-0:1.98.8-1.fc44.x86_6 100% |  11.3 MiB/s |  15.2 MiB |  00m01s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.165 --------------------------------------------------------------------------------
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.165 [10/10] Total                           100% |   9.2 MiB/s |  27.4 MiB |  00m03s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.167 Running transaction
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.537 [11/11] https://download.zerotier.com/c 100% |   9.9 KiB/s |   3.1 KiB |  00m00s
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.537 --------------------------------------------------------------------------------
[12:30:10 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.537 [11/11] Total                           100% |   9.2 MiB/s |  27.4 MiB |  00m03s
[12:30:11 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.540 Importing OpenPGP key 0x23E52A61:
[12:30:11 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.540  UserID     : "ZeroTier, Inc. (ZeroTier Support and Release Signing Key) <contact@zerotier.com>"
[12:30:11 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.540  Fingerprint: 74A5E9C458E1A431F1DA57A71657198823E52A61
[12:30:11 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.540  From       : https://download.zerotier.com/contact@zerotier.com.gpg
[12:30:11 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 6.623 The key was successfully imported.
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 7.631 [ 1/23] Verify package files            100% | 103.0   B/s |  10.0   B |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.016 [ 2/23] Prepare transaction             100% |  25.0   B/s |  10.0   B |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.106 [ 3/23] Installing rocm-smi-0:7.1.1-4.f 100% |  48.4 MiB/s |   2.7 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.139 [ 4/23] Installing zerotier-one-0:1.16. 100% | 157.2 MiB/s |  10.7 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.341 [ 5/23] Installing tailscale-0:1.98.8-1 100% | 270.3 MiB/s |  48.9 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.460 [ 6/23] Installing ksystemlog-0:26.08.1 100% |  45.3 MiB/s |   6.3 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.502 [ 7/23] Installing btop-0:1.4.7-1.fc44. 100% |  55.1 MiB/s |   1.8 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.507 [ 8/23] Installing google-arimo-fonts-0 100% | 188.1 MiB/s |   2.3 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.517 [ 9/23] Installing google-crosextra-cal 100% |  61.9 MiB/s | 253.6 KiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.522 [10/23] Installing google-carlito-fonts 100% | 294.0 MiB/s |   2.6 MiB |  00m00s
[12:30:12 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 8.561 [11/23] Installing brightnessctl-0:0.5. 100% |   1.5 MiB/s |  30.4 KiB |  00m00s
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 9.686 [12/23] Installing mesa-demos-0:9.0.0-1 100% |  21.1 MiB/s |  24.2 MiB |  00m01s
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 9.686 Complete!
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 9.707 [32m=============================== End 'dnf' Module ===============================[0m
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #61 DONE 9.7s
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 [stage-5 15/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"skip-unavailable":true,"packages":["maliit-keyboard"]}}'
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 0.090 [33m============================== Start 'dnf' Module ==============================[0m
[12:30:14 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 0.187 Updating and loading repositories:
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  ZeroTier, Inc. RPM Release Repository  100% |   5.1 KiB/s |   3.0 KiB |  00m01s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  Fedora 44 - x86_64 - Updates Archive   100% |   5.7 KiB/s |   3.4 KiB |  00m01s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  Fedora 44 - x86_64 - Updates           ???% |   0.0   B/s |   0.0   B |  02m02s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 >>> Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds] - https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 >>> Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds] - https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 >>> Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds] - https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 >>> Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds] - https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 >>> Download failed: Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds],Cannot prepare internal mirrorlist: Parse error at line: 1 (Document is empty
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 )
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  negativo17 - Multimedia                100% |   7.2 KiB/s |   4.3 KiB |  00m01s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  Fedora 44 - x86_64                     100% | 202.0   B/s |  24.1 KiB |  02m02s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  Copr repo for akmods owned by ublue-os 100% |   3.6 KiB/s |   1.5 KiB |  00m00s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0  Copr repo for asus-linux owned by luke 100% |   4.0 KiB/s |   1.5 KiB |  00m00s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 Failed to download metadata (metalink: "https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64") for repository "updates": Download failed: Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds]
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 External command had a non-zero exit code
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 122.0 [31m============================= Failed 'dnf' Module =============================[0m
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m #62 ERROR: process "/bin/sh -c /tmp/scripts/run_module.sh 'dnf' '{\"type\":\"dnf\",\"install\":{\"skip-unavailable\":true,\"packages\":[\"maliit-keyboard\"]}}'" did not complete successfully: exit code: 1
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  > [stage-5 15/22] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"skip-unavailable":true,"packages":["maliit-keyboard"]}}':
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 >>> Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds] - https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 >>> Download failed: Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds],Cannot prepare internal mirrorlist: Parse error at line: 1 (Document is empty
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 )
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0  negativo17 - Multimedia                100% |   7.2 KiB/s |   4.3 KiB |  00m01s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0  Fedora 44 - x86_64                     100% | 202.0   B/s |  24.1 KiB |  02m02s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0  Copr repo for akmods owned by ublue-os 100% |   3.6 KiB/s |   1.5 KiB |  00m00s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0  Copr repo for asus-linux owned by luke 100% |   4.0 KiB/s |   1.5 KiB |  00m00s
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 Failed to download metadata (metalink: "https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64") for repository "updates": Download failed: Curl error (28): Timeout was reached for https://mirrors.fedoraproject.org/metalink?repo=updates-released-f44&arch=x86_64 [Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds]
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 External command had a non-zero exit code
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 122.0 [31m============================= Failed 'dnf' Module =============================[0m
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  [33m1 warning found (use docker --debug to expand):
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m [0m - FromAsCasing: 'as' and 'FROM' keywords' casing do not match (line 30)
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m Containerfile.Tep0gPKGzPo:183
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  182 |     /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"packages":["plasma-keyboard","mesa-demos","libva-utils","vulkan-tools","iio-sensor-proxy","alsa-utils","pciutils","usbutils","btop","ksystemlog","brightnessctl","fprintd","wireguard-tools","tailscale","zerotier-one","google-carlito-fonts","google-crosextra-caladea-fonts","google-arimo-fonts","liberation-sans-fonts","liberation-serif-fonts","tuned","tuned-ppd"]}}'
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  183 | >>> RUN \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  184 | >>> --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  185 | >>> --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  186 | >>> --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  187 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  188 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  189 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  190 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  191 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  192 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  193 | >>> --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  194 | >>> /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","install":{"skip-unavailable":true,"packages":["maliit-keyboard"]}}'
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m  195 |     RUN \
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[12:32:16 [38;5;27mg.i/b/z13-fedora:latest[0m] [1m=>[0m ERROR: failed to build: failed to solve: process "/bin/sh -c /tmp/scripts/run_module.sh 'dnf' '{\"type\":\"dnf\",\"install\":{\"skip-unavailable\":true,\"packages\":[\"maliit-keyboard\"]}}'" did not complete successfully: exit code: 1
[12:32:16 [31mERROR[0m] [1m=>[0m Failed:
  [31m×[0m Failed to build image ghcr.io/baitian6641/z13-fedora:latest

  Try running with `[93m-vv[0m` for trace logging.
  You can also open an issue at https://github.com/blue-build/cli/issues

```
