#!/bin/bash
. functions.sh
. packages.sh

# Use GRUB as a boot loader

cmd_do pacman -Syu --noconfirm --needed ${boot_loader_pkgs[@]}
cmd_do grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
cmd_do grub-mkconfig -o /boot/grub/grub.cfg
