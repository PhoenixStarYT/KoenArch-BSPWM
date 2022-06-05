#!/bin/bash

#Welcome
echo -ne "
██████╗ ███████╗██╗   ██╗████████╗
██╔══██╗██╔════╝╚██╗ ██╔╝╚══██╔══╝
██████╔╝███████╗ ╚████╔╝    ██║
██╔═══╝ ╚════██║  ╚██╔╝     ██║
██║     ███████║   ██║      ██║
╚═╝     ╚══════╝   ╚═╝      ╚═╝
██╗  ██╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ███████╗
██║ ██╔╝██╔═══██╗██╔════╝████╗  ██║██╔═══██╗██╔════╝
█████╔╝ ██║   ██║█████╗  ██╔██╗ ██║██║   ██║███████╗
██╔═██╗ ██║   ██║██╔══╝  ██║╚██╗██║██║   ██║╚════██║
██║  ██╗╚██████╔╝███████╗██║ ╚████║╚██████╔╝███████║
╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
"

#Paru AUR Helper
pacman --noconfirm -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#Update and install base Packages
pacman --noconfirm -Syu 
pacman --noconfirm -S neofetch
pacman --noconfirm -S htop
pacman --noconfirm -S bspwm
pacman --noconfirm -S sxhkd
pacman --noconfirm -S polybar
pacman --noconfirm -S rofi
pacman --noconfirm -S picom
pacman --noconfirm -S git
pacman --noconfirm -S kitty

#Install Desktop apps
pacman --noconfirm -S thunar
pacman --noconfirm -S nitrogen
pacman --noconfirm -S variety
pacman --noconfirm -S lxappearance
pacman --noconfirm -S pulseaudio
pacman --noconfirm -S pavucontrol
pacman --noconfirm -S sddm
pacman --noconfirm -S rofi

#Setup SDDM
systemctl enable sddm

#Theming & Fonts
paru --noconfirm -S xfce-theme-greybird
paru --noconfirm -S bibata-cursor-theme
paru --noconfirm -S otf-font-awesome
paru --noconfirm -S ttf-font-awesome
cd $builddir
mkdir -p /home/$username/.config
mv ~/KoenArch-BSPWM/dotconfig/* ~/.config
mv ~/KoenArch-BSPWM/.* ~

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts
fc-cache -vf
