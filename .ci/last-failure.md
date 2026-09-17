# Last ISO failure

Run: https://github.com/BaiTian6641/z13-fedora/actions/runs/35201644372
Commit: 84d68b8bb07aacd8832eab218c7eb3c86d19abc6

```
Unable to find image 'ghcr.io/jasonn3/build-container-installer:v1.5.0' locally
v1.5.0: Pulling from jasonn3/build-container-installer
8532d3aa7560: Pulling fs layer
4e670e049a45: Pulling fs layer
8532d3aa7560: Verifying Checksum
8532d3aa7560: Download complete
8532d3aa7560: Pull complete
4e670e049a45: Verifying Checksum
4e670e049a45: Download complete
4e670e049a45: Pull complete
Digest: sha256:354e6d7fd4cb1850fb5adcfc3535f2c271dcecbc127730a058c0cbedbd9d3f51
Status: Downloaded newer image for ghcr.io/jasonn3/build-container-installer:v1.5.0
+ mknod -m 0660 /dev/loop0 b 7 0
+ true
+ [[ -d /cache/skopeo ]]
+ [[ ! -d /cache/dnf ]]
+ make z13-fedora-latest-20260917-84d68b8.iso-Checksum ADDITIONAL_TEMPLATES= ARCH=x86_64 DNF_CACHE=/cache/dnf ENROLLMENT_PASSWORD=universalblue EXTRA_BOOT_PARAMS= FLATPAK_REMOTE_NAME=flathub FLATPAK_REMOTE_URL=https://flathub.org/repo/flathub.flatpakrepo IMAGE_NAME=z13-fedora IMAGE_REPO=ghcr.io/baitian6641 IMAGE_SIGNED=true IMAGE_SRC= IMAGE_TAG=latest ISO_NAME=/github/workspace/z13-fedora-latest-20260917-84d68b8.iso 'REPOS=/etc/yum.repos.d/*.repo' SECURE_BOOT_KEY_URL=https://github.com/ublue-os/bazzite/raw/main/secure_boot.der VARIANT=kinoite VERSION=44 WEB_UI=false
make -w -C z13-fedora-latest-20260917-84d68b8.iso-Checksum 
make[1]: Entering directory '/build-container-installer'
make[1]: Leaving directory '/build-container-installer'
make[1]: *** z13-fedora-latest-20260917-84d68b8.iso-Checksum: No such file or directory.  Stop.
make: *** [Makefile:148: z13-fedora-latest-20260917-84d68b8.iso-Checksum] Error 2
```
