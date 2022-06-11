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
#Theming & Fonts
paru --noconfirm -S xfce-theme-greybird
paru --noconfirm -S bibata-cursor-theme
sudo pacman --noconfirm -S breeze
paru --noconfirm -S otf-font-awesome
paru --noconfirm -S ttf-font-awesome

cd $builddir
mkdir .config
cd koenarch-bspwm
mv dotconfig/* ~/.config
mv .* ~

# Download Nordic Theme
cd /usr/share/themes/
sudo git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/share/fonts
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
sudo unzip Meslo.zip -d /usr/share/fonts
fc-cache -vf

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
