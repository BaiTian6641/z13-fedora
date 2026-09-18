# ISO layout verification

- iso: `./z13-fedora-latest-20260918-6b4498e.iso`
- date: 2026-09-18T03:39:04Z
## ISO root listing
```
xorriso 1.5.6 : RockRidge filesystem manipulator, libburnia project.

xorriso : NOTE : Loading ISO image tree from LBA 0
xorriso : UPDATE :     614 nodes read in 1 seconds
libisofs: NOTE : Found hidden El-Torito image for EFI.
libisofs: NOTE : EFI image start and size: 6542226 * 2048 , 26488 * 512
xorriso : NOTE : Detected El-Torito boot information which currently is set to be discarded
Drive current: -indev './z13-fedora-latest-20260918-6b4498e.iso'
Media current: stdio file, overwriteable
Media status : is written , is appendable
Boot record  : El Torito , MBR protective-msdos-label grub2-mbr cyl-align-off GPT
Media summary: 1 session, 6548864 data blocks, 12.5g data, 58.3g free
Volume id    : 'z13-x86_64-latest'
total 8
-rw-r--r--    1 0        0              28 Sep 18 03:26 '.discinfo'
drwxr-xr-x    1 0        0               0 Sep 18 03:31 'EFI'
-rw-r--r--    1 0        0            1295 May 13 00:00 'Fedora-Legal-README.txt'
-rw-r--r--    1 0        0            1063 May 13 00:00 'LICENSE'
drwxr-xr-x    1 0        0               0 Sep 18 03:31 'boot'
drwxr-xr-x    1 0        0               0 Sep 18 03:31 'images'
-r--r--r--    1 0        0            1466 Sep 18 03:22 'sb_pubkey.der'
drwxr-xr-x    1 0        0               0 Sep 18 03:33 'z13-fedora'
```
- env image: /images/install.img (Squashfs filesystem, little endian, version 4.0, xz compressed, 945172098 bytes, 38017 inodes, blocksize: 131072 bytes, created: Fri Sep 18 03:30:29 2026)
## interactive-defaults.ks (key lines)
```
9:ostreecontainer --url=/run/install/repo/z13-fedora --transport=oci --no-signature-verification
12:# z13-layout v2: five-partition design pre-seeded (ESP /boot / RECOVERY /var, LUKS on / and /var)
13:clearpart --all --drives=nvme0n1
14:zerombr
15:part /boot/efi --fstype=efi --size=1024
16:part /boot --fstype=ext4 --size=2048
17:part / --fstype=btrfs --size=102400 --encrypted
18:part /var/mnt/recovery --fstype=ext4 --label=RECOVERY --size=10240
19:part /var --fstype=xfs --encrypted --grow
```
- verdict: **PASS** - pre-seeded layout is inside the ISO
