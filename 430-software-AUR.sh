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
		"${aur_command}" -S --noconfirm --needed "$1"
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

echo
tput setaf 4
echo "######################################################################################################"
echo "Installing AUR packages"
echo "######################################################################################################"
echo
tput sgr0

read -erp ":: Proceed with installation? [Y/n] " CHOICE

case ${CHOICE} in

[Yy][Ee][Ss] | [Yy] | "")

	if command -v yay >/dev/null 2>&1; then
		aur_command="yay"
	elif command -v paru >/dev/null 2>&1; then
		aur_command="paru"
	elif command -v trizen >/dev/null 2>&1; then
		aur_command="trizen"
	elif command -v pikaur >/dev/null 2>&1; then
		aur_command="pikaur"
	elif command -v pakku >/dev/null 2>&1; then
		aur_command="pakku"
	elif command -v aurman >/dev/null 2>&1; then
		aur_command="aurman"
	elif command -v aura >/dev/null 2>&1; then
		aur_command="sudo aura"
	fi
	;;

[Nn][Oo] | [Nn] | *)
	tput setaf 5
	echo "######################################################################################################"
	echo "We did nothing as per your request"
	echo "######################################################################################################"
	echo
	tput sgr0
	exit 0
	;;
esac

###############################################################################

func_category Any_software_from_AUR

list=(
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

###############################################################################

func_category Any_software_from_arcolinux_repositories

list=(
	# archlinux-tweak-tool-git
	brave-bin
	# gitahead
	hardcode-fixer-git
	# gnome-terminal-transparency
	libadwaita-without-adwaita-git
	# librewolf-bin
	mintstick-git
	oh-my-zsh-git
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
