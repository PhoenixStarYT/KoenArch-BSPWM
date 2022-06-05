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

#Setup SDDM
sudo systemctl --noconfirm enable sddm

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
