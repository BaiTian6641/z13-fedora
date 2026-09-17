# Last ISO failure

Run: https://github.com/BaiTian6641/z13-fedora/actions/runs/35202937713
Commit: b4ce6c0de9dc6a0c94fc8b603a38273ed96cae6c

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
+ make /github/workspace/z13-fedora-latest-20260917-b4ce6c0.iso-CHECKSUM ADDITIONAL_TEMPLATES= ARCH=x86_64 DNF_CACHE=/cache/dnf ENROLLMENT_PASSWORD=universalblue EXTRA_BOOT_PARAMS= FLATPAK_REMOTE_NAME=flathub FLATPAK_REMOTE_URL=https://flathub.org/repo/flathub.flatpakrepo IMAGE_NAME=z13-fedora IMAGE_REPO=ghcr.io/baitian6641 IMAGE_SIGNED=true IMAGE_SRC= IMAGE_TAG=latest ISO_NAME=/github/workspace/z13-fedora-latest-20260917-b4ce6c0.iso 'REPOS=/etc/yum.repos.d/*.repo' SECURE_BOOT_KEY_URL=https://github.com/ublue-os/bazzite/raw/main/secure_boot.der VARIANT=kinoite VERSION=44 WEB_UI=false
make -w -C external lorax/branch-44
make[1]: Entering directory '/build-container-installer/external'
git config advice.detachedHead false
cd lorax && git reset --hard HEAD && git checkout tags/lorax-44.6-1
HEAD is now at ffba3078 Add prefixdevname support to the boot.iso
Previous HEAD position was ffba3078 Add prefixdevname support to the boot.iso
HEAD is now at 9a140ee6 Automatic commit of package [lorax] release [44.6-1].
touch lorax/branch-44
make[1]: Leaving directory '/build-container-installer/external'
make -w -C lorax_templates post_install_configure_upgrades.tmpl
make[1]: Entering directory '/build-container-installer/lorax_templates'
header=0; skip=0; while read -r line; do if [[ $line =~ ^\<\% ]]; then if [[ 'true' == 'true' ]]; then echo $line >> post_install_configure_upgrades.tmpl; fi; echo >> post_install_configure_upgrades.tmpl; else if [[ $header == 0 ]]; then if [[ $line =~ ^\#\#\ (.*)$ ]]; then echo "append usr/share/anaconda/post-scripts/install_configure_upgrades.ks \"%post --erroronfail ${BASH_REMATCH[1]}\"" >> post_install_configure_upgrades.tmpl; skip=1; else echo "append usr/share/anaconda/post-scripts/install_configure_upgrades.ks \"%post --erroronfail\"" >> post_install_configure_upgrades.tmpl; fi; header=1; fi; if [[ $skip == 0 ]]; then echo "append usr/share/anaconda/post-scripts/install_configure_upgrades.ks \"${line//\"/\\\"}\"" >> post_install_configure_upgrades.tmpl; fi; skip=0; fi; done < scripts/post/install_configure_upgrades; echo "append usr/share/anaconda/post-scripts/install_configure_upgrades.ks \"%end\"" >> post_install_configure_upgrades.tmpl
make[1]: Leaving directory '/build-container-installer/lorax_templates'
make -w -C lorax_templates install_include_post.tmpl
make[1]: Entering directory '/build-container-installer/lorax_templates'
echo '<%page />' > install_include_post.tmpl
for file in  install_configure_upgrades  secureboot_enroll_key; do echo "append usr/share/anaconda/interactive-defaults.ks \"%include /usr/share/anaconda/post-scripts/${file}.ks\"" >> install_include_post.tmpl; done
make[1]: Leaving directory '/build-container-installer/lorax_templates'
make -w -C lorax_templates post_secureboot_enroll_key.tmpl
make[1]: Entering directory '/build-container-installer/lorax_templates'
header=0; skip=0; while read -r line; do if [[ $line =~ ^\<\% ]]; then if [[ 'true' == 'true' ]]; then echo $line >> post_secureboot_enroll_key.tmpl; fi; echo >> post_secureboot_enroll_key.tmpl; else if [[ $header == 0 ]]; then if [[ $line =~ ^\#\#\ (.*)$ ]]; then echo "append usr/share/anaconda/post-scripts/secureboot_enroll_key.ks \"%post --erroronfail ${BASH_REMATCH[1]}\"" >> post_secureboot_enroll_key.tmpl; skip=1; else echo "append usr/share/anaconda/post-scripts/secureboot_enroll_key.ks \"%post --erroronfail\"" >> post_secureboot_enroll_key.tmpl; fi; header=1; fi; if [[ $skip == 0 ]]; then echo "append usr/share/anaconda/post-scripts/secureboot_enroll_key.ks \"${line//\"/\\\"}\"" >> post_secureboot_enroll_key.tmpl; fi; skip=0; fi; done < scripts/post/secureboot_enroll_key; echo "append usr/share/anaconda/post-scripts/secureboot_enroll_key.ks \"%end\"" >> post_secureboot_enroll_key.tmpl
make[1]: Leaving directory '/build-container-installer/lorax_templates'
make -w -C repos *.repo
make[1]: Entering directory '/build-container-installer/repos'
cp /etc/yum.repos.d/*.repo           *.repo
cp: target '*.repo': No such file or directory
make[1]: *** [Makefile:5: *.repo] Error 1
make: *** [Makefile:148: repos/*.repo] Error 2
make[1]: Leaving directory '/build-container-installer/repos'
```
