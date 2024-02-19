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

flatpak_install() {
	flatpak install -y flathub "$@"
}

###############################################################################

echo
tput setaf 4
echo "######################################################################################################"
echo "> Installation of Flatpak"
echo "######################################################################################################"
echo
tput sgr0

read -erp ":: Proceed with installation? [Y/n] " CHOICE

case ${CHOICE} in

[Yy][Ee][Ss] | [Yy] | "")

	echo
	sudo pacman -S --noconfirm --needed flatpak
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "Installing flatpak applications..."
	echo "######################################################################################################"
	echo
	tput sgr0

	read -erp ":: Continue? [Y/n] " CHOICE

	case ${CHOICE} in

	[Yy][Ee][Ss] | [Yy] | "")

		flatpak_pkgs=(
			com.github.tchx84.Flatseal
			runtime/org.gtk.Gtk3theme.Arc-Dark/x86_64/3.22
			com.usebottles.bottles
			runtime/org.kde.KStyle.Kvantum/x86_64/5.15
			runtime/org.kde.KStyle.Kvantum/x86_64/5.15-21.08
			runtime/org.kde.KStyle.Kvantum/x86_64/5.15-22.08
			runtime/org.kde.KStyle.Kvantum/x86_64/5.15-23.08
			runtime/org.kde.KStyle.Kvantum/x86_64/6.5
			runtime/org.kde.KStyle.Kvantum/x86_64/6.6
		)

		printf '\n'
		flatpak_install "${flatpak_pkgs[@]}"
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

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
