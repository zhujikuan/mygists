#!/bin/bash

logo () {
    # This will be shown on every set as user is progressing
    echo -ne "
    [0;1;31;91m▄[0;1;33;93m▄[0m                  [0;1;34;94m▄[0;1;35;95m▄▄[0;1;31;91m▄[0m      [0;1;36;96m▄[0;1;34;94m▄▄[0;1;35;95m▄[0m               
    [0;1;33;93m█[0;1;32;92m█[0m                  [0;1;35;95m▀[0;1;31;91m▀█[0;1;33;93m█[0m      [0;1;34;94m▀[0;1;35;95m▀█[0;1;31;91m█[0m               
    [0;1;32;92m█[0;1;36;96m█▄[0;1;34;94m██[0;1;35;95m██[0;1;31;91m▄[0m   [0;1;32;92m▄█[0;1;36;96m██[0;1;34;94m█▄[0m     [0;1;33;93m█[0;1;32;92m█[0m        [0;1;31;91m█[0;1;33;93m█[0m       [0;1;35;95m▄█[0;1;31;91m██[0;1;33;93m█▄[0m  
    [0;1;36;96m█[0;1;34;94m█▀[0m   [0;1;31;91m█[0;1;33;93m█[0m  [0;1;32;92m█[0;1;36;96m█▄[0;1;34;94m▄▄[0;1;35;95m▄█[0;1;31;91m█[0m    [0;1;32;92m█[0;1;36;96m█[0m        [0;1;33;93m█[0;1;32;92m█[0m      [0;1;35;95m█[0;1;31;91m█▀[0m  [0;1;32;92m▀█[0;1;36;96m█[0m 
    [0;1;34;94m█[0;1;35;95m█[0m    [0;1;33;93m█[0;1;32;92m█[0m  [0;1;36;96m█[0;1;34;94m█▀[0;1;35;95m▀▀[0;1;31;91m▀▀[0;1;33;93m▀[0m    [0;1;36;96m█[0;1;34;94m█[0m        [0;1;32;92m█[0;1;36;96m█[0m      [0;1;31;91m█[0;1;33;93m█[0m    [0;1;36;96m█[0;1;34;94m█[0m 
    [0;1;35;95m█[0;1;31;91m█[0m    [0;1;32;92m█[0;1;36;96m█[0m  [0;1;34;94m▀[0;1;35;95m██[0;1;31;91m▄▄[0;1;33;93m▄▄[0;1;32;92m█[0m    [0;1;34;94m█[0;1;35;95m█▄[0;1;31;91m▄▄[0m     [0;1;36;96m█[0;1;34;94m█▄[0;1;35;95m▄▄[0m   [0;1;33;93m▀[0;1;32;92m██[0;1;36;96m▄▄[0;1;34;94m██[0;1;35;95m▀[0m 
    [0;1;31;91m▀[0;1;33;93m▀[0m    [0;1;36;96m▀[0;1;34;94m▀[0m    [0;1;31;91m▀[0;1;33;93m▀▀[0;1;32;92m▀▀[0m      [0;1;31;91m▀▀[0;1;33;93m▀▀[0m      [0;1;35;95m▀▀[0;1;31;91m▀▀[0m     [0;1;36;96m▀[0;1;34;94m▀▀[0;1;35;95m▀[0m   
    -------------------------------------------------------------------------
    hello this is zhujikuan
    -------------------------------------------------------------------------
    " 
}

update_mirrorlist(){
    clear
    logo
    cp -f /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    echo  '
    ##
    ## Arch Linux repository mirrorlist
    ## Generated on 2022-03-05
    ##

## China
#Server = http://mirrors.163.com/archlinux/$repo/os/$arch
Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch
Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch
#Server = http://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.cqu.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.dgut.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.hit.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.hit.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirror.lzu.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.neusoft.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.nju.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.nju.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirror.redrock.team/archlinux/$repo/os/$arch
#Server = https://mirror.redrock.team/archlinux/$repo/os/$arch
#Server = https://mirrors.sjtug.sjtu.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
Server = http://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.wsyu.edu.cn/archlinux/$repo/os/$arch
#Server = https://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch
#Server = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch
' > /etc/pacman.d/mirrorlist
pacman -Syy
    sleep 3
#cat /etc/pacman.d/mirrorlist
}
# arg1:/dev/sda
disk(){
    clear
    logo
    fdisk $1 << EOF
g
n


+500M

n


+2G


n




w
EOF
    clear
    fdisk $1 -l
    sleep 3
}

pwd ;exit;
update_mirrorlist
disk /dev/sda
set +x
timedatectl set-ntp true

mkfs.ext4 /dev/sda3
mkswap /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount /dev/sda3  /mnt
swapon /dev/sda2

pacstrap /mnt base linux linux-firmware \
	net-tools \
	man-db man-pages base-devel  \
	vim vi  \
	dhcpcd openssh git

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt ./1-chroot.sh



