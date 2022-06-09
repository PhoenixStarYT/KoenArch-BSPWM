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
sudo pacman --noconfirm -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#Update and install base Packages
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S neofetch
sudo pacman --noconfirm -S htop
sudo pacman --noconfirm -S bspwm
sudo pacman --noconfirm -S sxhkd
sudo pacman --noconfirm -S polybar
sudo pacman --noconfirm -S rofi
sudo pacman --noconfirm -S picom
sudo pacman --noconfirm -S git
sudo pacman --noconfirm -S kitty

#Install Desktop apps
sudo pacman --noconfirm -S thunar
sudo pacman --noconfirm -S nitrogen
sudo pacman --noconfirm -S variety
sudo pacman --noconfirm -S lxappearance
sudo pacman --noconfirm -S pulseaudio
sudo pacman --noconfirm -S pavucontrol
sudo pacman --noconfirm -S sddm
sudo pacman --noconfirm -S rofi

#Theming & Fonts
paru --noconfirm -S xfce-theme-greybird
paru --noconfirm -S bibata-cursor-theme
paru --noconfirm -S otf-font-awesome
paru --noconfirm -S ttf-font-awesome

#Setup SDDM
sudo systemctl --noconfirm enable sddm

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
