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

echo
tput setaf 4
echo "######################################################################################################"
echo "> Installation of Fonts"
echo "######################################################################################################"
tput sgr0

list=(
	adobe-source-code-pro-fonts
	awesome-terminal-fonts
	noto-fonts
	noto-fonts-emoji
	terminus-font
	ttf-dejavu
	ttf-fantasque-nerd
	ttf-firacode-nerd
	ttf-font-awesome
	ttf-hack
	ttf-iosevka-nerd
	ttf-jetbrains-mono-nerd
	ttf-mononoki-nerd
	ttf-nerd-fonts-symbols
	ttf-nerd-fonts-symbols-common
	ttf-nerd-fonts-symbols-mono
	ttf-sourcecodepro-nerd
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
tput setaf 6
echo "######################################################################################################"
echo "Fonts have been installed"
echo "######################################################################################################"
echo
tput sgr0
