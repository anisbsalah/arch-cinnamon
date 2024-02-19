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
# DECLARATION OF FUNCTIONS
#
##################################################################################################################

func_install() {
	if pacman -Qi "$1" &>/dev/null; then
		tput setaf 2
		echo "######################################################################################################"
		echo "################# The package '$1' is already installed"
		echo "######################################################################################################"
		echo
		tput sgr0
	else
		tput setaf 11
		echo "######################################################################################################"
		echo "################# Installing $1..."
		echo "######################################################################################################"
		echo
		tput sgr0
		sudo pacman -S --noconfirm --needed "$1"
	fi
}

function_cinnamon() {
	list=(
		cinnamon
		cinnamon-translations
		lightdm
		lightdm-slick-greeter
		lightdm-settings
		# lightdm-gtk-greeter
		# lightdm-gtk-greeter-settings
		blueman
		gnome-screenshot
		# gnome-shell
		gnome-system-monitor
		gnome-terminal
		nemo-fileroller
		nemo-share
		# metacity
		xed
		xviewer
	)

	count=0
	for name in "${list[@]}"; do
		count=$((count + 1))
		echo
		tput setaf 3
		echo "Package nr. ${count}) ${name}"
		tput sgr0
		func_install "${name}"
	done

	echo
	tput setaf 6
	echo "######################################################################################################"
	echo "Software has been installed"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

echo
tput setaf 4
echo "######################################################################################################"
echo "> Installation of CINNAMON desktop environment"
echo "######################################################################################################"
tput sgr0

function_cinnamon

###############################################################################

echo
tput setaf 5
echo "######################################################################################################"
echo "Copying all files and folders from /etc/skel to ~"
echo "######################################################################################################"
echo
tput sgr0

BACKUP_DATE="$(date +%Y.%m.%d-%H.%M.%S)"

cp -Rf ~/.config ~/.config-backup-"${BACKUP_DATE}"
cp -arf /etc/skel/. ~

echo
tput setaf 5
echo "######################################################################################################"
echo "Enabling lightdm as display manager"
echo "######################################################################################################"
echo
tput sgr0

# [[ -f /etc/lightdm/lightdm.conf ]] && sudo sed -i 's/[#[:space:]]*greeter-session=.*/greeter-session=lightdm-gtk-greeter/g' /etc/lightdm/lightdm.conf
[[ -f /etc/lightdm/lightdm.conf ]] && sudo sed -i 's/[#[:space:]]*greeter-session=.*/greeter-session=lightdm-slick-greeter/g' /etc/lightdm/lightdm.conf

sudo systemctl enable lightdm.service -f

echo
tput setaf 5
echo "######################################################################################################"
echo "Creating user directories"
echo "######################################################################################################"
echo
tput sgr0

sudo pacman -S --noconfirm --needed xdg-utils xdg-user-dirs

echo
tput setaf 6
echo "######################################################################################################"
echo "You now have a very minimal functional desktop"
echo "######################################################################################################"
tput sgr0
tput setaf 1
echo "######################################################################################################"
echo "Reboot your system!"
echo "######################################################################################################"
echo
tput sgr0
