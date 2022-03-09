#!/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

echo '
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8  
' > /etc/local.gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo ${HOSTNAME} > /etc/hostname
echo "
127.0.0.1	localhost
::1		localhost
127.0.1.1	${HOSTNAME}.localdomain	${HOSTNAME} # 主机名.本地域名 主机名
" > /etc/hosts

passwd root << EOF
a
a

EOF

pacman -S iw wpa_supplicant dialog
pacman -S intel-ucode
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

exit
