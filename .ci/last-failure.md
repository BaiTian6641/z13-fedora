# Last publish failure

Run: https://github.com/BaiTian6641/z13-fedora/actions/runs/35336731623
Commit: 7083e8d40cffbaf4ad8352372cf07270e9a9bb8c

```
[10:53:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:dfa1a63c20f86192c1902c6426acc50ddd65621677903bbb0a9a521a5316c4c8
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:dfa1a63c20f86192c1902c6426acc50ddd65621677903bbb0a9a521a5316c4c8 6.6s done
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 DONE 148.3s
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 [z13-fedora 1/1] FROM ghcr.io/ublue-os/kinoite-main@sha256:ad49c4bcd64e49725b008f60e852b6341091cec724c86ae66f34b88c3a6e2697
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:324cc7db9e6968f2ce9e615e901477cb5ffebcdd3844dc079e3f6050a7321020 0.0s done
[10:53:50 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:3e2ee6a170dcb44587b9b90dae765032718901cf228ede671837e68d3b903174
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:3e2ee6a170dcb44587b9b90dae765032718901cf228ede671837e68d3b903174 10.2s done
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 DONE 158.5s
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 [z13-fedora 1/1] FROM ghcr.io/ublue-os/kinoite-main@sha256:ad49c4bcd64e49725b008f60e852b6341091cec724c86ae66f34b88c3a6e2697
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 extracting sha256:bd9ddc54bea929a22b334e73e026d4136e5b73f5cc29942896c72e4ece69b13d done
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #44 DONE 158.5s
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:00 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #48 [stage-5  1/19] RUN --mount=type=bind,from=stage-keys,src=/keys,dst=/tmp/keys   mkdir -p /etc/pki/containers/   && cp /tmp/keys/* /etc/pki/containers/
[10:54:03 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #48 DONE 2.9s
[10:54:03 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:03 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #49 [stage-5  2/19] RUN --mount=type=bind,from=stage-bins,src=/bins,dst=/tmp/bins   mkdir -p /usr/bin/   && cp /tmp/bins/* /usr/bin/
[10:54:04 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #49 DONE 0.8s
[10:54:04 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:04 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #50 [stage-5  3/19] RUN --mount=type=bind,from=ghcr.io/blue-build/nushell-image:default,src=/nu,dst=/tmp/nu   mkdir -p /usr/libexec/bluebuild/nu   && cp -r /tmp/nu/* /usr/libexec/bluebuild/nu/
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #50 DONE 0.9s
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 [stage-5  4/19] RUN --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/scripts/,ro   /scripts/pre_build.sh
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 0.055 Preparing system for optfix...
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 0.061 Linking /opt => /usr/lib/opt
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #51 DONE 0.1s
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 [stage-5  5/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/files:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'files' '{"type":"files","files":[{"source":"system","destination":"/"}]}'
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.096 [33m============================= Start 'files' Module =============================[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.107 Adding files to image
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.118 Copying /tmp/files/system/* to /
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 0.131 [32m============================== End 'files' Module ==============================[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #52 DONE 0.1s
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 [stage-5  6/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/script:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'script' '{"type":"script","snippets":["chmod 0755 /usr/libexec/z13/*.sh"]}'
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.074 [33m============================ Start 'script' Module ============================[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.109 [32mRunning snippet:
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.109 [36mchmod 0755 /usr/libexec/z13/*.sh[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.119 [32mFinished running snippet:
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.119 [36mchmod 0755 /usr/libexec/z13/*.sh[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.120 [32mDone[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 0.125 [32m============================= End 'script' Module =============================[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #53 DONE 0.1s
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 [stage-5  7/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/dnf:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","repos":{"copr":["lukenukem/asus-linux"]},"install":{"skip-unavailable":true,"packages":["asusctl"]}}'
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.075 [33m============================== Start 'dnf' Module ==============================[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.134 [32mAdding COPR repositories:[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.136 - [36mlukenukem/asus-linux[0m
[10:54:05 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.138 Adding COPR repository: [36m'lukenukem/asus-linux'[0m
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.557  https://copr.fedorainfracloud.org/api_ 100% |   1.3 KiB/s | 470.0   B |  00m00s
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 Enabling a Copr repository. Please note that this repository is not part
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 of the main distribution, and quality may vary.
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 The Fedora Project does not exercise any power over the contents of
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 this repository beyond the rules outlined in the Copr FAQ at
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 <https://docs.copr.fedorainfracloud.org/user_documentation.html#what-i-can-build-in-copr>,
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 and packages are not held to any quality or security level.
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 Please do not file bug reports about these packages in Fedora
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.558 Bugzilla. In case of problems, contact the owner of this repository.
[10:54:06 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 0.592 Updating and loading repositories:
[10:54:08 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 2.435  Fedora 44 - x86_64 - Updates           100% |   6.9 MiB/s |  12.6 MiB |  00m02s
[10:54:08 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 2.721  Fedora 44 openh264 (From Cisco) - x86_ 100% |   2.5 KiB/s |   5.3 KiB |  00m02s
[10:54:09 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 3.699  negativo17 - Multimedia                100% |  83.7 KiB/s | 226.9 KiB |  00m03s
[10:54:09 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.273  Fedora 44 - x86_64                     100% |  12.3 MiB/s |  45.2 MiB |  00m04s
[10:54:10 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.293  Copr repo for akmods owned by ublue-os 100% |   7.2 KiB/s |  22.0 KiB |  00m03s
[10:54:10 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.297  Copr repo for asus-linux owned by luke 100% |   1.2 KiB/s |   3.5 KiB |  00m03s
[10:54:10 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 4.837  Fedora 44 - x86_64 - Updates Archive   100% |  10.2 MiB/s |  39.5 MiB |  00m04s
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.57 Repositories loaded.
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.57 Metadata cache created.
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.59 [32mInstalling packages:[0m
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.59 - [36masusctl[0m
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.59 [33mSetting arg [36m--skip-unavailable[0m
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 11.63 Updating and loading repositories:
[10:54:17 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 12.17 Repositories loaded.
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 Total size of inbound packages is 8 MiB. Need to download 8 MiB.
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 After this operation, 26 MiB extra will be used (install 26 MiB, remove 0 B).
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 Package  Arch   Version        Repository                                               Size
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 Installing:
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62  asusctl x86_64 0:6.3.8-2.fc44 copr:copr.fedorainfracloud.org:lukenukem:asus-linux  26.4 MiB
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 Transaction Summary:
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62  Installing:         1 package
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.62 
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.79 [1/1] asusctl-0:6.3.8-2.fc44.x86_64     100% |  47.8 MiB/s |   7.9 MiB |  00m00s
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.79 --------------------------------------------------------------------------------
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.79 [1/1] Total                             100% |  47.8 MiB/s |   7.9 MiB |  00m00s
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 14.79 Running transaction
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.08 [2/2] https://download.copr.fedorainfra 100% |   3.6 KiB/s |   1.0 KiB |  00m00s
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.08 --------------------------------------------------------------------------------
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.08 [2/2] Total                             100% |  47.8 MiB/s |   7.9 MiB |  00m00s
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.09 Importing OpenPGP key 0x0C881273:
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.09  UserID     : "lukenukem_asus-linux (None) <lukenukem#asus-linux@copr.fedorahosted.org>"
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.09  Fingerprint: 110A7FBEECDD95C6C9D2057C1622BB1E0C881273
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.09  From       : https://download.copr.fedorainfracloud.org/results/lukenukem/asus-linux/pubkey.gpg
[10:54:20 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.16 The key was successfully imported.
[10:54:21 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.57 [1/3] Verify package files              100% |  31.0   B/s |   1.0   B |  00m00s
[10:54:21 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 15.74 [2/3] Prepare transaction               100% |   5.0   B/s |   1.0   B |  00m00s
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 16.91 [3/3] Installing asusctl-0:6.3.8-2.fc44 100% |  22.6 MiB/s |  26.4 MiB |  00m01s
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 16.91 Complete!
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 16.93 [32m=============================== End 'dnf' Module ===============================[0m
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #54 DONE 17.0s
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 [stage-5  8/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}'
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.079 [33m============================ Start 'akmods' Module ============================[0m
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.092 nvidia-open kernel driver selected
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.094 Installing akmods
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.094 Total length of modules to install: 0
[10:54:22 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.094 Installing nvidia driver: nvidia-open
[10:54:23 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.577 Getting image source signatures
[10:54:23 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.577 Checking if image destination supports signatures
[10:54:23 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 0.577 Copying blob sha256:ca8e1ebcbd5f54fd9d6e8ff2c0b4ff4213321a347a8533f618d2d2613516424a
[10:54:24 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.442 Copying config sha256:403e8e8bcd90f75762cea3a6b6a244bc500c7c30260274bebee22de1d87a27ec
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.444 Writing manifest to image destination
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.445 Storing signatures
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.452 kernel-rpms/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.452 kernel-rpms/kernel-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.454 kernel-rpms/kernel-core-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.499 kernel-rpms/kernel-devel-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.614 kernel-rpms/kernel-devel-matched-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.616 kernel-rpms/kernel-modules-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 2.832 kernel-rpms/kernel-modules-core-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.019 kernel-rpms/kernel-modules-extra-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.029 kernel-rpms/kernel-uki-virt-7.2.5-200.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.261 rpms/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.261 rpms/common/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.261 rpms/common/broadcom-wl-6.30.223.271-28.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.263 rpms/common/framework-laptop-kmod-common-0.0.git.1477.f242674f-1.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.263 rpms/common/openrazer-0:3.12.4-1.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.263 rpms/common/v4l2loopback-0.15.4-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.263 rpms/common/vhba-20260313-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.264 rpms/common/xone-kmod-common-1000.0.0.git.1442.85e53359-2.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.264 rpms/common/xpadneo-kmod-common-0.10.4-1.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.264 rpms/kmods/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.265 rpms/kmods/kmod-framework-laptop-7.2.5-200.fc44.x86_64-0.0.git.1477.f242674f-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.265 rpms/kmods/kmod-openrazer-7.2.5-200.fc44.x86_64-3.12.4-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.266 rpms/kmods/kmod-v4l2loopback-7.2.5-200.fc44.x86_64-0.15.4-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.266 rpms/kmods/kmod-vhba-7.2.5-200.fc44.x86_64-20260313-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.266 rpms/kmods/kmod-wl-7.2.5-200.fc44.x86_64-6.30.223.271-63.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.270 rpms/kmods/kmod-xone-7.2.5-200.fc44.x86_64-1000.0.0.git.1442.85e53359-2.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.270 rpms/kmods/kmod-xpadneo-7.2.5-200.fc44.x86_64-0.10.4-1.fc44.x86_64.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.271 rpms/ublue-os/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.271 rpms/ublue-os/ublue-os-akmods-addons-0.8-1.fc44.noarch.rpm
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.271 rpms/ucore/
[10:54:25 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.277 Pulling akmods nvidia image
[10:54:26 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.735 Getting image source signatures
[10:54:26 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.735 Checking if image destination supports signatures
[10:54:26 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 3.735 Copying blob sha256:4c1cc439e72e51bfd966aa447d2e08aa1348f231d5b8ea60d54e8eb90549871a
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.739 Copying config sha256:78260c613bb334bb15fd8213cb818c51c8bb543966e414cd7b086637fe00f19d
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.741 Writing manifest to image destination
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.741 Storing signatures
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.749 kernel-rpms/
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.749 kernel-rpms/kernel-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.750 kernel-rpms/kernel-core-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.805 kernel-rpms/kernel-devel-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.962 kernel-rpms/kernel-devel-matched-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 8.964 kernel-rpms/kernel-modules-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.200 kernel-rpms/kernel-modules-core-7.2.5-200.fc44.x86_64.rpm
[10:54:31 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.378 kernel-rpms/kernel-modules-extra-7.2.5-200.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.389 kernel-rpms/kernel-uki-virt-7.2.5-200.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.587 rpms/
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.587 rpms/kmods/
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.587 rpms/kmods/kmod-nvidia-7.2.5-200.fc44.x86_64-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.611 rpms/kmods/nvidia/
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.611 rpms/kmods/nvidia-vars
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.611 rpms/nvidia/
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.612 rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.i686.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.612 rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.613 rpms/nvidia/nvidia-driver-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.622 rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.i686.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.690 rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.769 rpms/nvidia/nvidia-driver-cuda-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.771 rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.i686.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 9.969 rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.x86_64.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.20 rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.i686.rpm
[10:54:32 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.24 rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.55 rpms/nvidia/nvidia-kmod-common-615.71.09-1.fc44.noarch.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/nvidia-libXNVCtrl-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/nvidia-modprobe-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/nvidia-persistenced-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/nvidia-settings-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/nvidia-xconfig-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.75 rpms/nvidia/xorg-x11-nvidia-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.76 rpms/ublue-os/
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.76 rpms/ublue-os/nvidia-install.sh
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.76 rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.76 rpms/ucore/
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + : /tmp/akmods-rpms
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + : 1
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + source /tmp/akmods-rpms/kmods/nvidia-vars
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ DIST_ARCH=fc44.x86_64
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ KERNEL_VERSION=7.2.5-200.fc44.x86_64
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ KERNEL_MODULE_TYPE=open
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ KMOD_REPO=nvidia
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ RELEASE=fc44.x86_64
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 ++ NVIDIA_AKMOD_VERSION=615.71.09-1
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + find /tmp/akmods-rpms/
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/78260c613bb334bb15fd8213cb818c51c8bb543966e414cd7b086637fe00f19d
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/signature-2
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/manifest.json
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/ucore
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/ublue-os
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/ublue-os/nvidia-install.sh
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/signature-3
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/signature-1
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/4c1cc439e72e51bfd966aa447d2e08aa1348f231d5b8ea60d54e8eb90549871a
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-persistenced-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-kmod-common-615.71.09-1.fc44.noarch.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/xorg-x11-nvidia-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.i686.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-xconfig-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.i686.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-cuda-libs-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-modprobe-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/libnvidia-fbc-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.i686.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-common-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-settings-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-driver-libs-615.71.09-1.fc44.i686.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/nvidia/nvidia-libXNVCtrl-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/kmods
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/kmods/nvidia-vars
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/kmods/nvidia
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/kmods/kmod-nvidia-7.2.5-200.fc44.x86_64-615.71.09-1.fc44.x86_64.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/signature-4
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 /tmp/akmods-rpms/version
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + command -v dnf5
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + grep -q rpmfusion
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 10.99 + dnf5 repolist --all
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 11.04 + dnf5 config-manager setopt fedora-cisco-openh264.enabled=0
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 11.07 + dnf5 install -y /tmp/akmods-rpms/ublue-os/ublue-os-nvidia-addons-0.15-1.fc44.noarch.rpm
[10:54:33 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 11.11 Updating and loading repositories:
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 11.86 Repositories loaded.
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 Total size of inbound packages is 19 KiB. Need to download 0 B.
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 After this operation, 171 KiB extra will be used (install 171 KiB, remove 0 B).
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 Package                 Arch   Version       Repository        Size
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 Installing:
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20  ublue-os-nvidia-addons noarch 0:0.15-1.fc44 @commandline 171.4 KiB
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 Transaction Summary:
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20  Installing:         1 package
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.20 Running transaction
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.30 [1/3] Verify package files              100% |   0.0   B/s |   1.0   B |  00m00s
[10:54:34 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 12.47 [2/3] Prepare transaction               100% |   6.0   B/s |   1.0   B |  00m00s
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.60 [3/3] Installing ublue-os-nvidia-addons 100% |  81.3 KiB/s | 173.2 KiB |  00m02s
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.60 Warning: skipped OpenPGP checks for 1 package from repository: @commandline
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.60 Complete!
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.61 + MULTILIB_PKGS=(mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libGL.i686 mesa-libgbm.i686 mesa-vulkan-drivers.i686)
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.61 ++ rpm -E '%{_arch}'
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.62 + [[ x86_64 == x86_64 ]]
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.62 + [[ 1 == 1 ]]
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.62 + dnf5 install -y mesa-dri-drivers.i686 mesa-filesystem.i686 mesa-libEGL.i686 mesa-libGL.i686 mesa-libgbm.i686 mesa-vulkan-drivers.i686
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 14.66 Updating and loading repositories:
[10:54:37 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.19 Repositories loaded.
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Package              Arch   Version                   Repository             Size
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Installing:
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-dri-drivers    i686   1:26.2.3-1.fc44           fedora-multimedia  56.9 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-libEGL         i686   1:26.2.3-1.fc44           fedora-multimedia 357.3 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-libGL          i686   1:26.2.3-1.fc44           fedora-multimedia 349.5 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-vulkan-drivers i686   1:26.2.3-1.fc44           fedora-multimedia 178.9 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Installing dependencies:
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  elfutils-libelf     i686   0:0.196-1.fc44            updates             1.4 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  expat               i686   0:2.8.3-1.fc44            updates           337.0 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  glibc               i686   0:2.43-8.fc44             updates             5.7 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libX11              i686   0:1.8.13-1.fc44           fedora              1.4 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libX11-xcb          i686   0:1.8.13-1.fc44           fedora             10.1 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libXau              i686   0:1.0.12-4.fc44           fedora             72.1 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libXext             i686   0:1.3.6-5.fc44            fedora             96.8 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libXxf86vm          i686   0:1.1.6-4.fc44            fedora             24.3 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libdisplay-info     i686   0:0.3.0-1.fc44            fedora            221.8 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libdrm              i686   0:2.4.134-1.fc44          updates           425.6 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libedit             i686   0:3.1-59.20260512cvs.fc44 updates           243.7 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libffi              i686   0:3.5.2-2.fc44            fedora             78.8 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libgcc              i686   0:16.2.1-2.fc44           updates           293.7 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libglvnd            i686   1:1.7.0-9.fc44            fedora            467.6 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libglvnd-egl        i686   1:1.7.0-9.fc44            fedora             67.9 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libglvnd-glx        i686   1:1.7.0-9.fc44            fedora            607.4 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libpciaccess        i686   0:0.16-17.fc44            fedora             47.7 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libstdc++           i686   0:16.2.1-2.fc44           updates             3.1 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libwayland-client   i686   0:1.26.0-1.fc44           updates            56.9 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libxcb              i686   0:1.17.0-7.fc44           fedora              1.0 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libxml2             i686   0:2.12.10-6.fc44          fedora              1.8 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libxshmfence        i686   0:1.3.2-8.fc44            fedora             11.6 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  libzstd             i686   0:1.5.7-5.fc44            fedora            923.8 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  llvm-filesystem     i686   0:22.1.8-4.fc44           updates             0.0   B
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  llvm-libs           i686   0:22.1.8-4.fc44           updates           144.1 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  lm_sensors-libs     i686   0:3.6.0-24.fc44           fedora             84.9 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-filesystem     i686   1:26.2.3-1.fc44           fedora-multimedia   3.6 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  mesa-libgbm         i686   1:26.2.3-1.fc44           fedora-multimedia  18.8 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  ncurses-libs        i686   0:6.6-1.fc44              fedora            960.5 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  spirv-tools-libs    i686   0:2026.1-1.fc44           fedora              6.4 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  systemd-libs        i686   0:259.9-1.fc44            updates             2.4 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  vulkan-loader       i686   0:1.4.341.0-1.fc44        fedora            625.1 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  xz-libs             i686   1:5.8.2-2.fc44            fedora            233.1 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  zlib-ng-compat      i686   0:2.3.3-3.fc44            fedora            189.0 KiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Installing weak dependencies:
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  glibc-gconv-extra   i686   0:2.43-8.fc44             updates             6.7 MiB
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Transaction Summary:
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56  Installing:        39 packages
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 Total size of inbound packages is 89 MiB. Need to download 89 MiB.
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 15.56 After this operation, 417 MiB extra will be used (install 417 MiB, remove 0 B).
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.03 [ 1/39] libX11-xcb-0:1.8.13-1.fc44.i686 100% | 242.1 KiB/s |  10.9 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.05 [ 2/39] libxshmfence-0:1.3.2-8.fc44.i68 100% | 833.6 KiB/s |  13.3 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.11 [ 3/39] libxcb-0:1.17.0-7.fc44.i686     100% |   2.1 MiB/s | 256.5 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.13 [ 4/39] libzstd-0:1.5.7-5.fc44.i686     100% |   4.7 MiB/s | 364.1 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.13 [ 5/39] lm_sensors-libs-0:3.6.0-24.fc44 100% |   2.1 MiB/s |  42.1 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.15 [ 6/39] zlib-ng-compat-0:2.3.3-3.fc44.i 100% |   3.9 MiB/s |  99.2 KiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.21 [ 7/39] spirv-tools-libs-0:2026.1-1.fc4 100% |  21.9 MiB/s |   1.9 MiB |  00m00s
[10:54:38 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.44 [ 8/39] mesa-filesystem-1:26.2.3-1.fc44 100% |  31.7 KiB/s |   9.0 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.57 [ 9/39] mesa-libgbm-1:26.2.3-1.fc44.i68 100% |  43.7 KiB/s |  15.5 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.59 [10/39] libXau-0:1.0.12-4.fc44.i686     100% |   1.8 MiB/s |  34.1 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.84 [11/39] expat-0:2.8.3-1.fc44.i686       100% | 342.9 KiB/s | 137.1 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.87 [12/39] mesa-libGL-1:26.2.3-1.fc44.i686 100% | 497.0 KiB/s | 139.2 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.90 [13/39] libX11-0:1.8.13-1.fc44.i686     100% |  25.3 MiB/s | 699.4 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.91 [14/39] libXext-0:1.3.6-5.fc44.i686     100% |   3.3 MiB/s |  43.7 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.93 [15/39] libXxf86vm-0:1.1.6-4.fc44.i686  100% |   1.0 MiB/s |  19.2 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.96 [16/39] libglvnd-glx-1:1.7.0-9.fc44.i68 100% |   5.6 MiB/s | 132.9 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 16.97 [17/39] libglvnd-egl-1:1.7.0-9.fc44.i68 100% |   2.8 MiB/s |  37.5 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.19 [18/39] mesa-libEGL-1:26.2.3-1.fc44.i68 100% | 403.6 KiB/s | 142.9 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.22 [19/39] libglvnd-1:1.7.0-9.fc44.i686    100% |   4.6 MiB/s | 114.0 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.23 [20/39] libdisplay-info-0:0.3.0-1.fc44. 100% |   6.7 MiB/s |  89.5 KiB |  00m00s
[10:54:39 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.25 [21/39] vulkan-loader-0:1.4.341.0-1.fc4 100% |  12.3 MiB/s | 176.5 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.67 [22/39] mesa-dri-drivers-1:26.2.3-1.fc4 100% |   8.6 MiB/s |  14.5 MiB |  00m02s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.83 [23/39] glibc-0:2.43-8.fc44.i686        100% |   3.7 MiB/s |   2.2 MiB |  00m01s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.91 [24/39] libdrm-0:2.4.134-1.fc44.i686    100% |   2.3 MiB/s | 179.8 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 17.93 [25/39] libpciaccess-0:0.16-17.fc44.i68 100% |   2.4 MiB/s |  29.9 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.00 [26/39] libgcc-0:16.2.1-2.fc44.i686     100% |   2.0 MiB/s | 152.0 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.11 [27/39] libstdc++-0:16.2.1-2.fc44.i686  100% |   9.6 MiB/s |   1.1 MiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.15 [28/39] elfutils-libelf-0:0.196-1.fc44. 100% | 510.1 KiB/s | 244.3 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.18 [29/39] libffi-0:3.5.2-2.fc44.i686      100% |   1.6 MiB/s |  40.1 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.19 [30/39] libwayland-client-0:1.26.0-1.fc 100% | 505.0 KiB/s |  35.9 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.25 [31/39] libxml2-0:2.12.10-6.fc44.i686   100% |  12.2 MiB/s | 759.7 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.32 [32/39] llvm-filesystem-0:22.1.8-4.fc44 100% | 143.1 KiB/s |  10.0 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.33 [33/39] xz-libs-1:5.8.2-2.fc44.i686     100% |   9.6 MiB/s | 127.8 KiB |  00m00s
[10:54:40 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.44 [34/39] systemd-libs-0:259.9-1.fc44.i68 100% |   8.6 MiB/s | 903.2 KiB |  00m00s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.51 [35/39] libedit-0:3.1-59.20260512cvs.fc 100% |   1.5 MiB/s | 115.2 KiB |  00m00s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.52 [36/39] ncurses-libs-0:6.6-1.fc44.i686  100% |  25.3 MiB/s | 362.1 KiB |  00m00s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.66 [37/39] mesa-vulkan-drivers-1:26.2.3-1. 100% |  17.1 MiB/s |  28.9 MiB |  00m02s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 18.66 [38/39] glibc-gconv-extra-0:2.43-8.fc44 100% |  11.9 MiB/s |   1.6 MiB |  00m00s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 19.24 [39/39] llvm-libs-0:22.1.8-4.fc44.i686  100% |  31.2 MiB/s |  33.2 MiB |  00m01s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 19.24 --------------------------------------------------------------------------------
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 19.24 [39/39] Total                           100% |  24.1 MiB/s |  88.8 MiB |  00m04s
[10:54:41 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 19.25 Running transaction
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 20.58 Transaction failed: Rpm transaction failed.
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 20.58   - file /usr/share/drirc.d/00-asahi-defaults.conf from install of mesa-dri-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-dri-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 20.58   - file /usr/share/drirc.d/00-anv-defaults.conf from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 20.58   - file /usr/share/licenses/mesa-vulkan-drivers/LICENSE.dependencies from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 20.59 [31m============================ Failed 'akmods' Module ============================[0m
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m #55 ERROR: process "/bin/sh -c /tmp/scripts/run_module.sh 'akmods' '{\"type\":\"akmods\",\"base\":\"main\",\"install\":[],\"nvidia-driver\":\"nvidia-open\"}'" did not complete successfully: exit code: 1
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  > [stage-5  8/19] RUN --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}':
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 18.66 [38/39] glibc-gconv-extra-0:2.43-8.fc44 100% |  11.9 MiB/s |   1.6 MiB |  00m00s
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 19.24 [39/39] llvm-libs-0:22.1.8-4.fc44.i686  100% |  31.2 MiB/s |  33.2 MiB |  00m01s
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 19.24 --------------------------------------------------------------------------------
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 19.24 [39/39] Total                           100% |  24.1 MiB/s |  88.8 MiB |  00m04s
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 19.25 Running transaction
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 20.58 Transaction failed: Rpm transaction failed.
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 20.58   - file /usr/share/drirc.d/00-asahi-defaults.conf from install of mesa-dri-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-dri-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 20.58   - file /usr/share/drirc.d/00-anv-defaults.conf from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 20.58   - file /usr/share/licenses/mesa-vulkan-drivers/LICENSE.dependencies from install of mesa-vulkan-drivers-1:26.2.3-1.fc44.i686 conflicts with file from package mesa-vulkan-drivers-1:26.2.2-1.fc44.x86_64
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 20.59 [31m============================ Failed 'akmods' Module ============================[0m
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m ------
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m 
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  [33m1 warning found (use docker --debug to expand):
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m [0m - FromAsCasing: 'as' and 'FROM' keywords' casing do not match (line 30)
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m Containerfile.Tep0gPKGzPo:98
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m   97 |     /tmp/scripts/run_module.sh 'dnf' '{"type":"dnf","repos":{"copr":["lukenukem/asus-linux"]},"install":{"skip-unavailable":true,"packages":["asusctl"]}}'
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m   98 | >>> RUN \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m   99 | >>> --mount=type=bind,from=stage-files,src=/files,dst=/tmp/files,rw \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  100 | >>> --mount=type=bind,from=ghcr.io/blue-build/modules/akmods:latest,src=/modules,dst=/tmp/modules,rw \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  101 | >>> --mount=type=bind,from=stage-akmods-main,src=/rpms,dst=/tmp/rpms,rw \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  102 | >>> --mount=type=bind,src=.bluebuild-scripts_513065f9,dst=/tmp/scripts/,ro \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  103 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/rpm-ostree,id=rpm-ostree-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  104 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/libdnf5,id=dnf-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  105 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/zypp,id=zypper-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  106 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apk,id=apk-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  107 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/apt,id=apt-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  108 | >>> --mount=type=cache,sharing=locked,dst=/var/cache/pacman,id=pacman-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  109 | >>> --mount=type=cache,sharing=locked,dst=/usr/lib/sysimage/cache/pacman,id=pacman-sysimage-cache-z13-fedora-44-stage-z13-fedora \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  110 | >>> /tmp/scripts/run_module.sh 'akmods' '{"type":"akmods","base":"main","install":[],"nvidia-driver":"nvidia-open"}'
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m  111 |     RUN \
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m --------------------
[10:54:43 [38;5;129mg.i/b/z13-fedora:latest[0m] [1m=>[0m ERROR: failed to build: failed to solve: process "/bin/sh -c /tmp/scripts/run_module.sh 'akmods' '{\"type\":\"akmods\",\"base\":\"main\",\"install\":[],\"nvidia-driver\":\"nvidia-open\"}'" did not complete successfully: exit code: 1
[10:54:43 [31mERROR[0m] [1m=>[0m Failed:
  [31m×[0m Failed to build image ghcr.io/baitian6641/z13-fedora:latest

  Try running with `[93m-vv[0m` for trace logging.
  You can also open an issue at https://github.com/blue-build/cli/issues

```
