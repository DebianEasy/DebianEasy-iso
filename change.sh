#!/bin/bash
for dir in `ls SpiralLinux* -d`
do
    #add and remove packages
    #all
    libexec/add.sh "$dir"/config/package-lists/* config/add.list
    libexec/remove.sh "$dir"/config/package-lists/* config/remove.list
    #spins
    libexec/add.sh "$dir"/config/package-lists/* config/$dir/add.list
    libexec/remove.sh "$dir"/config/package-lists/* config/$dir/remove.list
    #change files
    libexec/change-hook.sh "$dir"/config/hooks/normal/0999-spirallinux.hook.chroot
    #replace files
    cp -f ./config/files/mount.conf ./"$dir"/config/includes.chroot/etc/calamares/modules/mount.conf
    cp -f ./config/files/0090-remove-unwanted-packages.hook.chroot ./"$dir"/config/hooks/normal/0090-remove-unwanted-packages.hook.chroot
    cp -f ./config/files/0350-update-default-services-status.hook.chroot ./"$dir"/config/hooks/normal/0350-update-default-services-status.hook.chroot
    cp -f ./config/files/99backports ./"$dir"/config/includes.chroot/etc/apt/preferences.d/99backports
    #cp -f ./config/files/grubcfg.conf ./"$dir"/config/includes.chroot/etc/calamares/modules/grubcfg.conf
    cp -f ./config/files/config ./"$dir"/config/includes.chroot/usr/share/grub-btrfs-master/config
    cp -f ./config/files/splash.png ./"$dir"/config/bootloaders/isolinux/splash.png
    cp -f ./config/files/splash.png ./"$dir"/config/bootloaders/grub-pc/splash.png
    cp -f ./config/files/splash.png ./"$dir"/config/includes.chroot/boot/grub/splash.png
    cp -f ./config/files/hdd ./"$dir"/auto
    cp -f ./config/files/iso ./"$dir"/auto
    rm -r ./"$dir"/config/packages
    rm -r ./"$dir"/config/archives
    cp -r ./config/files/packages ./$dir/config/packages
    mkdir -p ./$dir/config/includes.chroot/var/linux-firmware
    cp -r ./config/files/firmware/* ./$dir/config/includes.chroot/var/linux-firmware/
    #cp -r ./config/files/install.desktop ./$dir/config/includes.chroot/etc/skel/Desktop/
    cp -r ./config/files/kernel-packages ./$dir/config/includes.chroot/var/
    cp -f ./config/files/mkiso ./"$dir"/
    rm ./"$dir"/config/includes.chroot/etc/apt/apt.conf.d/*
    rm -r ./"$dir"/config/includes.chroot/etc/fonts
    #rm -rf $dir/config/includes.chroot/lib/firmware/b43
    echo 'apt -y install /var/kernel-packages/*' >> $dir/config/hooks/normal/0090-remove-unwanted-packages.hook.chroot
    echo 'rm -r /var/kernel-packages/' >> $dir/config/hooks/normal/0999-spirallinux.hook.chroot
    echo 'Apt::Install-Recommends "true";' > ./"$dir"/config/includes.chroot/etc/apt/apt.conf.d/99recommands
    for pic in `ls ./"$dir"/config/includes.chroot/usr/share/wallpapers/`
    do
        echo $pic |grep .png >/dev/null && cp -r ./config/files/debian-white.png ./"$dir"/config/includes.chroot/usr/share/wallpapers/"$pic"
        echo $pic |grep .jpg >/dev/null && cp -r ./config/files/debian-white.jpg ./"$dir"/config/includes.chroot/usr/share/wallpapers/"$pic"
    done
done
