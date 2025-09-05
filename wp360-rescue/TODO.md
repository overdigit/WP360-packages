# WP360-rescue
 - if /dev/disk/by-label/WP360-{SAVE,RESTORE,RECOVER} exist,
 - or grep wp360-(restore|backup) /proc/cmdline, then:
 - MAC="$(cut /sys/class/net/eth0/address -d: -f1-6 -O)"
 - run the corresponding section:
## WP360-{save,backup}
 ### Prerequisite binaries
 - zstd (compression)
 - dd
 - e2fsck
 - resize2fs
 - dumpe2fs
 - awk
 - cut
 ### Order of operations
 - mkdir /mnt /mnt/target /mnt/boot
 - mount /dev/disk/by-label/WP360-{SAVE,INTERNAL-RECOVERY} /mnt/target
 - if exists /mnt/${MAC}.img.zst then goto umount end
 - mount /dev/disk/by-label/bootfs /mnt/boot
 - sed -i s/$/ resize-part-on-boot/ /mnt/boot/cmdline.txt
 - umount /mnt/boot
 - e2fsck -f /dev/disk/by-label/rootfs
 - && resize2fs -f -M /dev/disk/by-label/rootfs
 - parted /dev/mmcblk0 unit B p | awk (partition 2 start)
 - add ext4 size (round up) using dumpe2fs | awk
 - round up to $BS
 - dd if=/dev/mmcblk0 bs=$BS count=$((BYTES/BS)) | zstd -${COMPLEVEL}(9?) -o /mnt/target/${MAC}.img.zst
 - sync
 - umount /mnt/target

## WP360-{restore,recover}
 ### Prerequisite binaries
 - zstd (decompression)
 - dd
 ### Order of operations
 - mkdir /mnt
 - mount /dev/disk/by-label/WP360-{INTERNAL-RECOVERY,RECOVER}
 - if not exists /mnt/${MAC}.img.zst then goto unmount end #how?
 - zstd -d -k /mnt/${MAC}.img.zst | dd conv=sparse bs=$BS of=/dev/mmcblk0
 - umount /mnt
