# Last publish failure

Run: https://github.com/BaiTian6641/z13-fedora/actions/runs/35409704330
Commit: 914b59cf29c6bc75e1302445ab94029d19d5ca7f

```
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 [z13-fedora 1/1] FROM ghcr.io/ublue-os/kinoite-main@sha256:ad49c4bcd64e49725b008f60e852b6341091cec724c86ae66f34b88c3a6e2697
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 extracting sha256:324cc7db9e6968f2ce9e615e901477cb5ffebcdd3844dc079e3f6050a7321020 0.1s done
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 DONE 152.8s
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 [z13-fedora 1/1] FROM ghcr.io/ublue-os/kinoite-main@sha256:ad49c4bcd64e49725b008f60e852b6341091cec724c86ae66f34b88c3a6e2697
[00:36:08 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 extracting sha256:3e2ee6a170dcb44587b9b90dae765032718901cf228ede671837e68d3b903174
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 extracting sha256:3e2ee6a170dcb44587b9b90dae765032718901cf228ede671837e68d3b903174 14.9s done
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 DONE 167.6s
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 [z13-fedora 1/1] FROM ghcr.io/ublue-os/kinoite-main@sha256:ad49c4bcd64e49725b008f60e852b6341091cec724c86ae66f34b88c3a6e2697
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 extracting sha256:bd9ddc54bea929a22b334e73e026d4136e5b73f5cc29942896c72e4ece69b13d done
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #43 DONE 167.6s
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #48 [stage-5  1/19] RUN --mount=type=bind,from=stage-keys,src=/keys,dst=/tmp/keys   mkdir -p /etc/pki/containers/   && cp /tmp/keys/* /etc/pki/containers/
[00:36:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #48 DONE 5.1s
[00:36:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #49 [stage-5  2/19] RUN --mount=type=bind,from=stage-bins,src=/bins,dst=/tmp/bins   mkdir -p /usr/bin/   && cp /tmp/bins/* /usr/bin/
[00:36:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #49 DONE 1.1s
[00:36:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #50 [stage-5  3/19] RUN --mount=type=bind,from=ghcr.io/blue-build/nushell-image:default,src=/nu,dst=/tmp/nu   mkdir -p /usr/libexec/bluebuild/nu   && cp -r /tmp/nu/* /usr/libexec/bluebuild/nu/
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #50 DONE 1.4s
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 [stage-5  4/19] RUN --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/scripts/,ro   /scripts/pre_build.sh
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 0.041 Preparing system for optfix...
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 0.046 Linking /opt => /usr/lib/opt
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 DONE 0.1s
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 [stage-5  5/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/files:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'files' '{"type":"files","files":[{"source":"system","destination":"/"}]}'
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.085 [33m============================= Start 'files' Module =============================[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.091 Adding files to image
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.099 Copying /tmp/files/system/* to /
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.110 [32m============================== End 'files' Module ==============================[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 DONE 0.1s
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 [stage-5  6/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/script:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'script' '{"type":"script","snippets":["chmod 0755 /usr/libexec/z13/*.sh"]}'
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.058 [33m============================ Start 'script' Module ============================[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.078 [32mRunning snippet:
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.078 [36mchmod 0755 /usr/libexec/z13/*.sh[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.086 [32mFinished running snippet:
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.086 [36mchmod 0755 /usr/libexec/z13/*.sh[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.087 [32mDone[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.090 [32m============================= End 'script' Module =============================[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 DONE 0.1s
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 [stage-5  7/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","repos":{"copr":["lukenukem/asus-linux"]},"install":{"skip-unavailable":true,"packages":["asusctl"]}}'
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.054 [33m============================== Start 'dnf' Module ==============================[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.092 [32mAdding COPR repositories:[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.093 - [36mlukenukem/asus-linux[0m
[00:36:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.094 Adding COPR repository: [36m'lukenukem/asus-linux'[0m
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.759  https://copr.fedorainfracloud.org/api_ 100% | 769.0   B/s | 470.0   B |  00m01s
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 Enabling a Copr repository. Please note that this repository is not part
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 of the main distribution, and quality may vary.
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 The Fedora Project does not exercise any power over the contents of
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 this repository beyond the rules outlined in the Copr FAQ at
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 <https://docs.copr.fedorainfracloud.org/user_documentation.html#what-i-can-build-in-copr>,
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 and packages are not held to any quality or security level.
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 Please do not file bug reports about these packages in Fedora
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.760 Bugzilla. In case of problems, contact the owner of this repository.
[00:36:32 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.784 Updating and loading repositories:
[00:36:34 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 2.850  Fedora 44 - x86_64 - Updates           100% |   6.2 MiB/s |  12.8 MiB |  00m02s
[00:36:34 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 3.060  Fedora 44 - x86_64 - Updates Archive   100% |  19.6 MiB/s |  39.5 MiB |  00m02s
[00:36:34 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 3.197  Fedora 44 openh264 (From Cisco) - x86_ 100% |   2.2 KiB/s |   5.3 KiB |  00m02s
[00:36:35 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 3.746  negativo17 - Multimedia                100% |  84.3 KiB/s | 227.9 KiB |  00m03s
[00:36:35 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 3.973  Copr repo for asus-linux owned by luke 100% |   1.4 KiB/s |   3.5 KiB |  00m03s
[00:36:35 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.028  Copr repo for akmods owned by ublue-os 100% |   8.3 KiB/s |  22.0 KiB |  00m03s
[00:36:35 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.511  Fedora 44 - x86_64                     100% |   9.8 MiB/s |  36.5 MiB |  00m04s
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.146 Repositories loaded.
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.146 Metadata cache created.
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.161 [32mInstalling packages:[0m
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.162 - [36masusctl[0m
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.164 [33mSetting arg [36m--skip-unavailable[0m
[00:36:39 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.194 Updating and loading repositories:
[00:36:40 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 8.588 Repositories loaded.
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 Total size of inbound packages is 8 MiB. Need to download 8 MiB.
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 After this operation, 26 MiB extra will be used (install 26 MiB, remove 0 B).
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 Package  Arch   Version        Repository                                               Size
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 Installing:
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40  asusctl x86_64 0:6.3.8-2.fc44 copr:copr.fedorainfracloud.org:lukenukem:asus-linux  26.4 MiB
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 Transaction Summary:
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40  Installing:         1 package
[00:36:41 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.40 
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.68 [1/1] asusctl-0:6.3.8-2.fc44.x86_64     100% |  28.4 MiB/s |   7.9 MiB |  00m00s
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.68 --------------------------------------------------------------------------------
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.68 [1/1] Total                             100% |  28.4 MiB/s |   7.9 MiB |  00m00s
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.68 Running transaction
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87 [2/2] https://download.copr.fedorainfra 100% |   5.5 KiB/s |   1.0 KiB |  00m00s
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87 --------------------------------------------------------------------------------
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87 [2/2] Total                             100% |  28.4 MiB/s |   7.9 MiB |  00m00s
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87 Importing OpenPGP key 0x0C881273:
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87  UserID     : "lukenukem_asus-linux (None) <lukenukem#asus-linux@copr.fedorahosted.org>"
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87  Fingerprint: 110A7FBEECDD95C6C9D2057C1622BB1E0C881273
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 10.87  From       : https://download.copr.fedorainfracloud.org/results/lukenukem/asus-linux/pubkey.gpg
[00:36:42 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.43 The key was successfully imported.
[00:36:43 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.74 [1/3] Verify package files              100% |  45.0   B/s |   1.0   B |  00m00s
[00:36:43 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.83 [2/3] Prepare transaction               100% |   8.0   B/s |   1.0   B |  00m00s
[00:36:44 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 13.48 [3/3] Installing asusctl-0:6.3.8-2.fc44 100% |  16.0 MiB/s |  26.4 MiB |  00m02s
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 13.48 Complete!
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 13.50 [32m=============================== End 'dnf' Module ===============================[0m
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 DONE 13.5s
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 [stage-5  8/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}'
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.061 [33m============================ Start 'akmods' Module ============================[0m
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.071 nvidia-open kernel driver selected
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.072 Installing akmods
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.072 Total length of modules to install: 0
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.072 Installing nvidia driver: nvidia-open
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.932 Getting image source signatures
[00:36:45 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.932 Checking if image destination supports signatures
[00:36:46 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.932 Copying blob sha256:ca8e1ebcbd5f54fd9d6e8ff2c0b4ff4213321a347a8533f618d2d2613516424a
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.514 Copying config sha256:403e8e8bcd90f75762cea3a6b6a244bc500c7c30260274bebee22de1d87a27ec
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.515 Writing manifest to image destination
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.515 Storing signatures
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.521 kernel-rpms/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.521 kernel-rpms/kernel-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.522 kernel-rpms/kernel-core-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.543 kernel-rpms/kernel-devel-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.602 kernel-rpms/kernel-devel-matched-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.603 kernel-rpms/kernel-modules-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.715 kernel-rpms/kernel-modules-core-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.795 kernel-rpms/kernel-modules-extra-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.799 kernel-rpms/kernel-uki-virt-7.2.5-200.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.878 rpms/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.878 rpms/common/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.878 rpms/common/broadcom-wl-6.30.223.271-28.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/framework-laptop-kmod-common-0.0.git.1477.f242674f-1.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/openrazer-0:3.12.4-1.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/v4l2loopback-0.15.4-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/vhba-20260313-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/xone-kmod-common-1000.0.0.git.1442.85e53359-2.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.879 rpms/common/xpadneo-kmod-common-0.10.4-1.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.880 rpms/kmods/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.880 rpms/kmods/kmod-framework-laptop-7.2.5-200.fc44.x86_64-0.0.git.1477.f242674f-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.880 rpms/kmods/kmod-openrazer-7.2.5-200.fc44.x86_64-3.12.4-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.881 rpms/kmods/kmod-v4l2loopback-7.2.5-200.fc44.x86_64-0.15.4-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.881 rpms/kmods/kmod-vhba-7.2.5-200.fc44.x86_64-20260313-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.881 rpms/kmods/kmod-wl-7.2.5-200.fc44.x86_64-6.30.223.271-63.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.883 rpms/kmods/kmod-xone-7.2.5-200.fc44.x86_64-1000.0.0.git.1442.85e53359-2.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.883 rpms/kmods/kmod-xpadneo-7.2.5-200.fc44.x86_64-0.10.4-1.fc44.x86_64.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.883 rpms/ublue-os/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.883 rpms/ublue-os/ublue-os-akmods-addons-0.8-1.fc44.noarch.rpm
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.884 rpms/ucore/
[00:36:52 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 7.888 Pulling akmods nvidia image
[00:36:53 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.868 Getting image source signatures
[00:36:53 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.868 Checking if image destination supports signatures
[00:36:53 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.868 Copying blob sha256:4c1cc439e72e51bfd966aa447d2e08aa1348f231d5b8ea60d54e8eb90549871a
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.17 Copying config sha256:78260c613bb334bb15fd8213cb818c51c8bb543966e414cd7b086637fe00f19d
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.17 Writing manifest to image destination
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.17 Storing signatures
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.18 kernel-rpms/
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.18 kernel-rpms/kernel-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.18 kernel-rpms/kernel-core-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.20 kernel-rpms/kernel-devel-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.26 kernel-rpms/kernel-devel-matched-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.27 kernel-rpms/kernel-modules-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.38 kernel-rpms/kernel-modules-core-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.47 kernel-rpms/kernel-modules-extra-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.47 kernel-rpms/kernel-uki-virt-7.2.5-200.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.56 rpms/
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.56 rpms/kmods/
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.56 rpms/kmods/kmod-nvidia-7.2.5-200.fc44.x86_64-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/kmods/nvidia/
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/kmods/nvidia-vars
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/nvidia/
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.i686.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.57 rpms/nvidia/nvidia-driver-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.58 rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.i686.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.60 rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.64 rpms/nvidia/nvidia-driver-cuda-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.65 rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.i686.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.73 rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.82 rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.i686.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.85 rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.x86_64.rpm
[00:37:13 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 28.99 rpms/nvidia/nvidia-kmod-common-615.71.09-1.fc44.noarch.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.06 rpms/nvidia/nvidia-libXNVCtrl-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.06 rpms/nvidia/nvidia-modprobe-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.06 rpms/nvidia/nvidia-persistenced-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.06 rpms/nvidia/nvidia-settings-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.06 rpms/nvidia/nvidia-xconfig-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.07 rpms/nvidia/xorg-x11-nvidia-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.07 rpms/ublue-os/
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.07 rpms/ublue-os/nvidia-install.sh
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.07 rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.07 rpms/ucore/
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + : /tmp/akmods-rpms
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + : 1
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + source /tmp/akmods-rpms/kmods/nvidia-vars
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ DIST_ARCH=fc44.x86_64
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ KERNEL_VERSION=7.2.5-200.fc44.x86_64
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ KERNEL_MODULE_TYPE=open
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ KMOD_REPO=nvidia
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ RELEASE=fc44.x86_64
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 ++ NVIDIA_AKMOD_VERSION=615.71.09-1
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + find /tmp/akmods-rpms/
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/78260c613bb334bb15fd8213cb818c51c8bb543966e414cd7b086637fe00f19d
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/signature-2
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/manifest.json
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/ucore
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/ublue-os
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/ublue-os/nvidia-install.sh
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/signature-3
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/signature-1
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/4c1cc439e72e51bfd966aa447d2e08aa1348f231d5b8ea60d54e8eb90549871a
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-persistenced-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-kmod-common-615.71.09-1.fc44.noarch.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/xorg-x11-nvidia-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.i686.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-xconfig-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.i686.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-modprobe-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.i686.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-settings-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.i686.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/nvidia/nvidia-libXNVCtrl-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/kmods
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/kmods/nvidia-vars
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/kmods/nvidia
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/kmods/kmod-nvidia-7.2.5-200.fc44.x86_64-615.71.09-1.fc44.x86_64.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/signature-4
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 /tmp/akmods-rpms/version
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + command -v dnf5
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + dnf5 repolist --all
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.27 + grep -q rpmfusion
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.31 + dnf5 config-manager setopt fedora-cisco-openh264.enabled=0
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.33 + dnf5 install -y /tmp/akmods-rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.36 Updating and loading repositories:
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 29.79 Repositories loaded.
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 Total size of inbound packages is 19 KiB. Need to download 0 B.
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 After this operation, 171 KiB extra will be used (install 171 KiB, remove 0 B).
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 Package                 Arch   Version       Repository        Size
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 Installing:
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03  ublue-os-nvidia-addons noarch 0:0.15-1.fc44 @commandline 171.4 KiB
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 Transaction Summary:
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03  Installing:         1 package
[00:37:14 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 
[00:37:15 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.03 Running transaction
[00:37:15 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.60 [1/3] Verify package files              100% |   0.0   B/s |   1.0   B |  00m00s
[00:37:15 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 30.70 [2/3] Prepare transaction               100% |  11.0   B/s |   1.0   B |  00m00s
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.09 [3/3] Installing ublue-os-nvidia-addons 100% |  39.4 KiB/s | 173.2 KiB |  00m04s
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.09 Warning: skipped OpenPGP checks for 1 package from repository: @commandline
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.09 Complete!
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.10 + MULTILIB_PKGS=(mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libGL.i686 mesa-libgbm.i686 mesa-vulkan-drivers.i686)
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.10 ++ rpm -E '%{_arch}'
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.10 + [[ x86_64 == x86_64 ]]
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.10 + [[ 1 == 1 ]]
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.10 + dnf5 install -y mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libGL.i686 mesa-libgbm.i686 mesa-vulkan-drivers.i686
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.13 Updating and loading repositories:
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.52 Repositories loaded.
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Package              Arch   Version                   Repository             Size
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Installing:
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-dri-drivers    i686   1:26.2.3-1.fc44           fedora-multimedia  56.9 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-libEGL         i686   1:26.2.3-1.fc44           fedora-multimedia 357.3 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-libGL          i686   1:26.2.3-1.fc44           fedora-multimedia 349.5 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-vulkan-drivers i686   1:26.2.3-1.fc44           fedora-multimedia 178.9 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Installing dependencies:
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  elfutils-libelf     i686   0:0.196-1.fc44            updates             1.4 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  expat               i686   0:2.8.3-1.fc44            updates           337.0 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  glibc               i686   0:2.43-8.fc44             updates             5.7 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libX11              i686   0:1.8.13-1.fc44           fedora              1.4 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libX11-xcb          i686   0:1.8.13-1.fc44           fedora             10.1 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libXau              i686   0:1.0.12-4.fc44           fedora             72.1 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libXext             i686   0:1.3.6-5.fc44            fedora             96.8 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libXxf86vm          i686   0:1.1.6-4.fc44            fedora             24.3 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libdisplay-info     i686   0:0.3.0-1.fc44            fedora            221.8 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libdrm              i686   0:2.4.134-1.fc44          updates           425.6 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libedit             i686   0:3.1-59.20260512cvs.fc44 updates           243.7 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libffi              i686   0:3.5.2-2.fc44            fedora             78.8 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libgcc              i686   0:16.2.1-2.fc44           updates           293.7 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libglvnd            i686   1:1.7.0-9.fc44            fedora            467.6 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libglvnd-egl        i686   1:1.7.0-9.fc44            fedora             67.9 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libglvnd-glx        i686   1:1.7.0-9.fc44            fedora            607.4 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libpciaccess        i686   0:0.16-17.fc44            fedora             47.7 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libstdc++           i686   0:16.2.1-2.fc44           updates             3.1 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libwayland-client   i686   0:1.26.0-1.fc44           updates            56.9 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libxcb              i686   0:1.17.0-7.fc44           fedora              1.0 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libxml2             i686   0:2.12.10-6.fc44          fedora              1.8 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libxshmfence        i686   0:1.3.2-8.fc44            fedora             11.6 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  libzstd             i686   0:1.5.7-5.fc44            fedora            923.8 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  llvm-filesystem     i686   0:22.1.8-4.fc44           updates             0.0   B
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  llvm-libs           i686   0:22.1.8-4.fc44           updates           144.1 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  lm_sensors-libs     i686   0:3.6.0-24.fc44           fedora             84.9 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-filesystem     i686   1:26.2.3-1.fc44           fedora-multimedia   3.6 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  mesa-libgbm         i686   1:26.2.3-1.fc44           fedora-multimedia  18.8 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  ncurses-libs        i686   0:6.6-1.fc44              fedora            960.5 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  spirv-tools-libs    i686   0:2026.1-1.fc44           fedora              6.4 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  systemd-libs        i686   0:259.9-1.fc44            updates             2.4 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  vulkan-loader       i686   0:1.4.341.0-1.fc44        fedora            625.1 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  xz-libs             i686   1:5.8.2-2.fc44            fedora            233.1 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  zlib-ng-compat      i686   0:2.3.3-3.fc44            fedora            189.0 KiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Installing weak dependencies:
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  glibc-gconv-extra   i686   0:2.43-8.fc44             updates             6.7 MiB
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Transaction Summary:
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75  Installing:        39 packages
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 Total size of inbound packages is 89 MiB. Need to download 89 MiB.
[00:37:20 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 35.75 After this operation, 417 MiB extra will be used (install 417 MiB, remove 0 B).
[00:37:21 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 36.83 [ 1/39] libX11-xcb-0:1.8.13-1.fc44.i686 100% |  45.0 KiB/s |  10.9 KiB |  00m00s
[00:37:22 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 37.24 [ 2/39] libxshmfence-0:1.3.2-8.fc44.i68 100% |  32.3 KiB/s |  13.3 KiB |  00m00s
[00:37:22 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 37.41 [ 3/39] libxcb-0:1.17.0-7.fc44.i686     100% | 310.9 KiB/s | 256.5 KiB |  00m01s
[00:37:22 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 37.88 [ 4/39] lm_sensors-libs-0:3.6.0-24.fc44 100% |  89.7 KiB/s |  42.1 KiB |  00m00s
[00:37:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 38.18 [ 5/39] libzstd-0:1.5.7-5.fc44.i686     100% | 389.4 KiB/s | 364.1 KiB |  00m01s
[00:37:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 38.49 [ 6/39] zlib-ng-compat-0:2.3.3-3.fc44.i 100% | 322.1 KiB/s |  99.2 KiB |  00m00s
[00:37:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 38.84 [ 7/39] mesa-dri-drivers-1:26.2.3-1.fc4 100% |   6.4 MiB/s |  14.5 MiB |  00m02s
[00:37:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 38.84 [ 8/39] mesa-filesystem-1:26.2.3-1.fc44 100% |  25.7 KiB/s |   9.0 KiB |  00m00s
[00:37:23 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 38.95 [ 9/39] mesa-libgbm-1:26.2.3-1.fc44.i68 100% | 136.4 KiB/s |  15.5 KiB |  00m00s
[00:37:24 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 39.75 [10/39] libXau-0:1.0.12-4.fc44.i686     100% |  42.5 KiB/s |  34.1 KiB |  00m01s
[00:37:24 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 39.87 [11/39] mesa-libGL-1:26.2.3-1.fc44.i686 100% |   1.2 MiB/s | 139.2 KiB |  00m00s
[00:37:24 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 39.99 [12/39] mesa-libEGL-1:26.2.3-1.fc44.i68 100% |   1.2 MiB/s | 142.9 KiB |  00m00s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.14 [13/39] expat-0:2.8.3-1.fc44.i686       100% | 105.8 KiB/s | 137.1 KiB |  00m01s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.36 [14/39] spirv-tools-libs-0:2026.1-1.fc4 100% | 789.0 KiB/s |   1.9 MiB |  00m02s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.48 [15/39] libXext-0:1.3.6-5.fc44.i686     100% | 126.4 KiB/s |  43.7 KiB |  00m00s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.73 [16/39] libXxf86vm-0:1.1.6-4.fc44.i686  100% |  51.2 KiB/s |  19.2 KiB |  00m00s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.88 [17/39] libglvnd-egl-1:1.7.0-9.fc44.i68 100% | 253.0 KiB/s |  37.5 KiB |  00m00s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 40.94 [18/39] libglvnd-glx-1:1.7.0-9.fc44.i68 100% | 288.2 KiB/s | 132.9 KiB |  00m00s
[00:37:25 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 41.02 [19/39] libX11-0:1.8.13-1.fc44.i686     100% | 675.7 KiB/s | 699.4 KiB |  00m01s
[00:37:26 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 41.26 [20/39] libglvnd-1:1.7.0-9.fc44.i686    100% | 364.1 KiB/s | 114.0 KiB |  00m00s
[00:37:26 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 41.31 [21/39] libdisplay-info-0:0.3.0-1.fc44. 100% | 315.1 KiB/s |  89.5 KiB |  00m00s
[00:37:26 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 41.62 [22/39] vulkan-loader-0:1.4.341.0-1.fc4 100% | 487.5 KiB/s | 176.5 KiB |  00m00s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.09 [23/39] elfutils-libelf-0:0.196-1.fc44. 100% | 519.9 KiB/s | 244.3 KiB |  00m00s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.29 [24/39] libdrm-0:2.4.134-1.fc44.i686    100% | 898.9 KiB/s | 179.8 KiB |  00m00s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.57 [25/39] mesa-vulkan-drivers-1:26.2.3-1. 100% |  17.2 MiB/s |  28.9 MiB |  00m02s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.71 [26/39] libgcc-0:16.2.1-2.fc44.i686     100% |   1.0 MiB/s | 152.0 KiB |  00m00s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.80 [27/39] libpciaccess-0:0.16-17.fc44.i68 100% |  59.0 KiB/s |  29.9 KiB |  00m01s
[00:37:27 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 42.90 [28/39] glibc-0:2.43-8.fc44.i686        100% |   1.4 MiB/s |   2.2 MiB |  00m02s
[00:37:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 43.00 [29/39] libwayland-client-0:1.26.0-1.fc 100% | 182.0 KiB/s |  35.9 KiB |  00m00s
[00:37:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 43.53 [30/39] libstdc++-0:16.2.1-2.fc44.i686  100% |   1.3 MiB/s |   1.1 MiB |  00m01s
[00:37:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 43.55 [31/39] libffi-0:3.5.2-2.fc44.i686      100% |  62.3 KiB/s |  40.1 KiB |  00m01s
[00:37:28 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 43.62 [32/39] llvm-filesystem-0:22.1.8-4.fc44 100% | 143.1 KiB/s |  10.0 KiB |  00m00s
[00:37:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 44.26 [33/39] xz-libs-1:5.8.2-2.fc44.i686     100% | 198.5 KiB/s | 127.8 KiB |  00m01s
[00:37:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 44.85 [34/39] libxml2-0:2.12.10-6.fc44.i686   100% | 572.9 KiB/s | 759.7 KiB |  00m01s
[00:37:29 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 44.90 [35/39] systemd-libs-0:259.9-1.fc44.i68 100% |   1.4 MiB/s | 903.2 KiB |  00m01s
[00:37:30 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 45.07 [36/39] libedit-0:3.1-59.20260512cvs.fc 100% | 543.5 KiB/s | 115.2 KiB |  00m00s
[00:37:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 46.14 [37/39] glibc-gconv-extra-0:2.43-8.fc44 100% |   1.5 MiB/s |   1.6 MiB |  00m01s
[00:37:31 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 46.15 [38/39] ncurses-libs-0:6.6-1.fc44.i686  100% | 289.2 KiB/s | 362.1 KiB |  00m01s
[00:37:49 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 64.51 [39/39] llvm-libs-0:22.1.8-4.fc44.i686  100% |   1.5 MiB/s |  33.2 MiB |  00m22s
[00:37:49 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 64.51 --------------------------------------------------------------------------------
[00:37:49 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 64.51 [39/39] Total                           100% |   3.1 MiB/s |  88.8 MiB |  00m29s
[00:37:49 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 64.51 Running transaction
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 65.48 Transaction failed: Rpm transaction failed.
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 65.48   - file /usr/share/drirc.d/00-asahi-defaults.conf from install of mesa-dri-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-dri-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 65.48   - file /usr/share/drirc.d/00-anv-defaults.conf from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 65.48   - file /usr/share/licenses/mesa-vulkan-drivers/LICENSE.dependencies from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 65.49 [31m============================ Failed 'akmods' Module ============================[0m
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 ERROR: process "/bin/sh -c /tmp/scripts/run_module.sh 'akmods' '{\"type\":\"akmods\",\"base\":\"main\",\"install\":[],\"nvidia-driver\":\"nvidia-open\"}'" did not complete successfully: exit code: 1
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  > [stage-5  8/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}':
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 46.15 [38/39] ncurses-libs-0:6.6-1.fc44.i686  100% | 289.2 KiB/s | 362.1 KiB |  00m01s
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 64.51 [39/39] llvm-libs-0:22.1.8-4.fc44.i686  100% |   1.5 MiB/s |  33.2 MiB |  00m22s
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 64.51 --------------------------------------------------------------------------------
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 64.51 [39/39] Total                           100% |   3.1 MiB/s |  88.8 MiB |  00m29s
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 64.51 Running transaction
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 65.48 Transaction failed: Rpm transaction failed.
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 65.48   - file /usr/share/drirc.d/00-asahi-defaults.conf from install of mesa-dri-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-dri-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 65.48   - file /usr/share/drirc.d/00-anv-defaults.conf from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 65.48   - file /usr/share/licenses/mesa-vulkan-drivers/LICENSE.dependencies from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 65.49 [31m============================ Failed 'akmods' Module ============================[0m
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  [33m1 warning found (use docker --debug to expand):
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m [0m - FromAsCasing: 'as' and 'FROM' keywords' casing do not match (line 30)
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m Containerfile.Tep0gPKGzPo:98
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m   97 |     /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","repos":{"copr":["lukenukem/asus-linux"]},"install":{"skip-unavailable":true,"packages":["asusctl"]}}'
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m   98 | >>> RUN \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m   99 | >>> --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  100 | >>> --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  101 | >>> --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  102 | >>> --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  103 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  104 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  105 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  106 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  107 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  108 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  109 | >>> --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  110 | >>> /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}'
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m  111 |     RUN \
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[00:37:50 [38;5;161mg.i/b/z13-fedora:latest[0m] [1m=>[0m ERROR: failed to build: failed to solve: process "/bin/sh -c /tmp/scripts/run_module.sh 'akmods' '{\"type\":\"akmods\",\"base\":\"main\",\"install\":[],\"nvidia-driver\":\"nvidia-open\"}'" did not complete successfully: exit code: 1
[00:37:50 [31mERROR[0m] [1m=>[0m Failed:
  [31m×[0m Failed to build image ghcr.io/baitian6641/z13-fedora:latest

  Try running with `[93m-vv[0m` for trace logging.
  You can also open an issue at https://github.com/blue-build/cli/issues

```
