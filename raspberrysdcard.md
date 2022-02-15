```bash
diskutil list
sudo diskutil eraseDisk FAT32 SDCARD MBRFormat /dev/disk2
diskutil list
sudo diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=~/Downloads/pios.img of=/dev/rdisk2
sudo diskutil eject /dev/disk2
