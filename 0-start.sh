#!/bin/bash
#set -e
##################################################################################################################
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
##################################################################################################################
#
# CURRENT CHOICES
#
##################################################################################################################

clear
echo "
 ██████╗██╗███╗   ██╗███╗   ██╗ █████╗ ███╗   ███╗ ██████╗ ███╗   ██╗
██╔════╝██║████╗  ██║████╗  ██║██╔══██╗████╗ ████║██╔═══██╗████╗  ██║
██║     ██║██╔██╗ ██║██╔██╗ ██║███████║██╔████╔██║██║   ██║██╔██╗ ██║
██║     ██║██║╚██╗██║██║╚██╗██║██╔══██║██║╚██╔╝██║██║   ██║██║╚██╗██║
╚██████╗██║██║ ╚████║██║ ╚████║██║  ██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
 ╚═════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
"
sudo pacman -Sy
./100-xorg.sh |& tee 100-xorg.log
./110-drivers.sh |& tee 110-drivers.log
./120-networking.sh |& tee 120-networking.log
./130-sound.sh |& tee 130-sound.log
./140-bluetooth.sh |& tee 140-bluetooth.log
./150-printing.sh |& tee 150-printing.log
./160-laptop.sh |& tee 160-laptop.log
./170-system-utilities.sh |& tee 170-system-utilities.log
./180-fonts.sh |& tee 180-fonts.log
./200-cinnamon-desktop.sh |& tee 200-cinnamon-desktop.log
./300-software-pacman.sh |& tee 300-software-pacman.log
./400-AUR-helper.sh |& tee 400-AUR-helper.log
# ./410-software-AUR.sh |& tee 410-software-AUR.log
./500-software-flatpak.sh |& tee 500-software-flatpak.log
./600-arcolinux-keys-and-repos.sh |& tee 600-arcolinux-keys-and-repos.log
./610-software-arcolinux.sh |& tee 610-software-arcolinux.log
# ./620-additional-arcolinux-software.sh |& tee 620-additional-arcolinux-software.log

echo "
██████╗  ██████╗ ███╗   ██╗███████╗
██╔══██╗██╔═══██╗████╗  ██║██╔════╝
██║  ██║██║   ██║██╔██╗ ██║█████╗  
██║  ██║██║   ██║██║╚██╗██║██╔══╝  
██████╔╝╚██████╔╝██║ ╚████║███████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝
"
