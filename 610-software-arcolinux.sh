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

func_category Any_software_from_arcolinux_repositories

list=(
	# archlinux-tweak-tool-git
	brave-bin
	# gitahead
	hardcode-fixer-git
	# gnome-terminal-transparency
	libadwaita-without-adwaita-git
	mintstick-git
	# librewolf-bin
	sublime-text-4
	ttf-icomoon-feather
	ventoy-bin
	vscodium-bin
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

echo "[*] Fixing hardcoded icon paths for applications - Wait for it..."
sudo hardcode-fixer

###############################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
