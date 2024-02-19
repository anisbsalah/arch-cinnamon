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

func_category() {
	echo
	tput setaf 4
	echo "######################################################################################################"
	echo "> Installing software for category '$1'"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

func_category Arcolinux-Desktop

list=(
	arcolinux-dconf-all-desktops-git
	arcolinux-cinnamon-git
	arcolinux-config-all-desktops-git
	thunar
	thunar-archive-plugin
	thunar-volman
	xfce4-terminal
	arcolinux-xfce-git
	arcolinux-local-xfce4-git
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

###############################################################################

func_category Arcolinux-General

list=(
	arcolinux-bin-git
	arcolinux-hblock-git
	arcolinux-root-git
	arcolinux-termite-themes-git
	archlinux-tweak-tool-git
	arcolinux-variety-git
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
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
