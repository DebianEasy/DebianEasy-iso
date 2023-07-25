#!/bin/bash
sed -i '/cd \/usr\/share\/grub-btrfs-master/d' $1
sed -i '/make install/d' $1
sed -i '/rm -R \/usr\/share\/grub-btrfs-master/d' $1
sed -i '/systemctl enable grub-btrfs.path/d' $1
sed -i 's/SpiralLinux/Debain Easy/g' $1
echo >> $1
echo '#Set timesync' >>$1
echo "timedatectl set-ntp true">> $1
echo >> $1
echo '#Set dkms autoinstall' >>$1
echo "dkms autoinstall">> $1
