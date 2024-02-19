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
echo "> Installation of Xorg display server"
echo "######################################################################################################"
tput sgr0

list=(
	# ----------------- # xorg
	xf86-video-vesa
	# xorg-bdftopcf
	# xorg-docs
	# xorg-font-util
	# xorg-fonts-100dpi
	# xorg-fonts-75dpi
	xorg-fonts-encodings
	xorg-iceauth
	# xorg-mkfontscale
	xorg-server
	xorg-server-common
	# xorg-server-devel
	# xorg-server-xephyr
	# xorg-server-xnest
	# xorg-server-xvfb
	# xorg-sessreg
	xorg-setxkbmap
	# xorg-smproxy
	# xorg-x11perf
	xorg-xauth
	# xorg-xbacklight
	# xorg-xcmsdb
	# xorg-xcursorgen
	# xorg-xdpyinfo
	# xorg-xdriinfo
	# xorg-xev
	# xorg-xgamma
	xorg-xhost
	xorg-xinput
	xorg-xkbcomp
	# xorg-xkbevd
	xorg-xkbutils
	xorg-xkill
	# xorg-xlsatoms
	# xorg-xlsclients
	xorg-xmodmap
	# xorg-xpr
	xorg-xprop
	xorg-xrandr
	xorg-xrdb
	# xorg-xrefresh
	xorg-xset
	# xorg-xsetroot
	# xorg-xvinfo
	xorg-xwayland # Provides compatibility for native X11 applications that are yet to provide Wayland support
	# xorg-xwd
	# xorg-xwininfo
	# xorg-xwud
	# ----------------- # xorg-apps
	# xorg-bdftopcf
	# xorg-iceauth
	# xorg-mkfontscale
	# xorg-sessreg
	# xorg-setxkbmap
	# xorg-smproxy
	# xorg-x11perf
	# xorg-xauth
	# xorg-xbacklight
	# xorg-xcmsdb
	# xorg-xcursorgen
	# xorg-xdpyinfo
	# xorg-xdriinfo
	# xorg-xev
	# xorg-xgamma
	# xorg-xhost
	# xorg-xinput
	# xorg-xkbcomp
	# xorg-xkbevd
	# xorg-xkbprint
	# xorg-xkbutils
	# xorg-xkill
	# xorg-xlsatoms
	# xorg-xlsclients
	# xorg-xmodmap
	# xorg-xpr
	# xorg-xprop
	# xorg-xrandr
	# xorg-xrdb
	# xorg-xrefresh
	# xorg-xset
	# xorg-xsetroot
	# xorg-xvinfo
	# xorg-xwd
	# xorg-xwininfo
	# xorg-xwud
	# ----------------- #
	xorg-xinit
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
echo "Xorg/Keyboard configuration"
echo "######################################################################################################"
echo
tput sgr0

echo "> Set X11 keymap to: fr"
sudo localectl set-x11-keymap fr

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
