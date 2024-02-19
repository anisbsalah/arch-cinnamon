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

function_pipewire() {
	list=(
		alsa-card-profiles
		alsa-firmware
		alsa-lib
		alsa-plugins
		alsa-utils
		sof-firmware
		wireplumber
		pipewire-jack
		pipewire
		pipewire-alsa
		pipewire-audio
		pipewire-docs
		pipewire-ffado
		pipewire-pulse
		pipewire-roc
		pipewire-v4l2
		pipewire-x11-bell
		pipewire-zeroconf
		lib32-pipewire
		lib32-pipewire-jack
		gst-plugin-pipewire
		gstreamer
		gst-libav
		gst-plugins-bad
		gst-plugins-base
		gst-plugins-good
		gst-plugins-ugly
		pavucontrol
		playerctl
		# volumeicon
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
	echo
	tput sgr0
}

function_pulseaudio() {
	list=(
		alsa-card-profiles
		alsa-firmware
		alsa-lib
		alsa-plugins
		alsa-utils
		sof-firmware
		pulseaudio
		pulseaudio-alsa
		pulseaudio-bluetooth
		pulseaudio-equalizer
		pulseaudio-jack # instead of jack2
		pulseaudio-lirc # for infrared volume control
		pulseaudio-rtp
		pulseaudio-zeroconf
		lib32-alsa-plugins
		lib32-libpulse
		gstreamer
		gst-libav
		gst-plugins-bad
		gst-plugins-base
		gst-plugins-good
		gst-plugins-ugly
		pavucontrol
		playerctl
		# volumeicon
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
	echo
	tput sgr0
}

###############################################################################

echo
tput setaf 4
echo "######################################################################################################"
echo "> Installation of Sound software"
echo "######################################################################################################"
tput sgr0
echo "######################################################################################################"
echo "Choose Pulseaudio or Pipewire to have sound"
echo "######################################################################################################"

echo "Select the correct number:"
echo "0) Do nothing"
echo "1) Pipewire"
echo "2) Pulseaudio"
read -erp "Enter the number... " CHOICE

case ${CHOICE} in

0)
	tput setaf 5
	echo "######################################################################################################"
	echo "We did nothing as per your request"
	echo "######################################################################################################"
	echo
	tput sgr0
	;;

1)
	function_pipewire
	;;
2)
	function_pulseaudio
	;;
*)
	tput setaf 1
	echo "######################################################################################################"
	echo "Choose the correct number"
	echo "######################################################################################################"
	echo
	tput sgr0
	;;
esac
