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

func_drivers() {
	echo
	tput setaf 4
	echo "######################################################################################################"
	echo "> Installing '$1' Drivers"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

func_drivers Graphics

GPU_TYPE=$(lspci -v | grep -A1 -e VGA -e 3D)

if grep -Eiq "NVIDIA|GeForce" <<<"${GPU_TYPE}"; then

	list=(
		xf86-video-nouveau
		mesa
		lib32-mesa
		libva-mesa-driver
		lib32-libva-mesa-driver
		libva-utils
	)

elif grep -Eiq "Radeon|AMD" <<<"${GPU_TYPE}"; then

	list=(
		xf86-video-amdgpu
		mesa
		lib32-mesa
		vulkan-icd-loader
		lib32-vulkan-icd-loader
		vulkan-radeon
		lib32-vulkan-radeon
		libva-mesa-driver
		lib32-libva-mesa-driver
		libva-utils
	)

elif grep -Eiq "Integrated Graphics Controller" <<<"${GPU_TYPE}"; then

	list=(
		#xf86-video-intel # for Intel GPU's Arch wiki recommends not to use 'xf86-video-intel' with Cinnamon
		xf86-video-vesa
		mesa
		lib32-mesa
		vulkan-icd-loader
		lib32-vulkan-icd-loader
		vulkan-intel
		lib32-vulkan-intel
		libva-intel-driver # intel-media-driver
		lib32-libva-intel-driver
		libva-utils
	)

elif grep -Eiq "Intel Corporation UHD" <<<"${GPU_TYPE}"; then

	list=(
		#xf86-video-intel # for Intel GPU's Arch wiki recommends not to use 'xf86-video-intel' with Cinnamon
		xf86-video-vesa
		mesa
		lib32-mesa
		vulkan-icd-loader
		lib32-vulkan-icd-loader
		vulkan-intel
		lib32-vulkan-intel
		libva-intel-driver # intel-media-driver
		lib32-libva-intel-driver
		libva-utils
	)

fi

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

func_drivers Input

list=(
	libinput
	xf86-input-elographics
	xf86-input-evdev
	xf86-input-libinput
	xf86-input-synaptics
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

func_drivers "Wireless Card"

WIRELESS_CARD=$(lspci -v | grep -i network)

if grep -Eiq "Broadcom" <<<"${WIRELESS_CARD}"; then
	if grep -Eiq "BCM43" <<<"${WIRELESS_CARD}"; then

		list=(
			dkms
			broadcom-wl-dkms
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

	fi

else
	tput setaf 5
	echo "########################################"
	echo " Nothing to do"
	echo "########################################"
	tput sgr0
fi

###############################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "Drivers have been installed"
echo "######################################################################################################"
echo
tput sgr0
