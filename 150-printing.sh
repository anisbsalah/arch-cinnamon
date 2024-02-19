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
echo "> Installation of Printing software"
echo "######################################################################################################"
tput sgr0

list=(
	cups
	cups-pdf
	cups-filters
	cups-pk-helper
	foomatic-db
	foomatic-db-engine
	foomatic-db-gutenprint-ppds
	foomatic-db-ppds
	foomatic-db-nonfree
	foomatic-db-nonfree-ppds
	ghostscript
	gsfonts
	gutenprint
	gtk3-print-backends
	libcups
	system-config-printer
	#sane
	#skanlite # QT Scan Application
	#simple-scan # GTK Scan Application
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
echo "Enabling services"
echo "######################################################################################################"
echo
tput sgr0

sudo systemctl enable --now cups.service

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
