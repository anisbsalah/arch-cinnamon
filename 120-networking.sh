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
echo "> Installation of Networking utils"
echo "######################################################################################################"
tput sgr0

list=(
	avahi
	bind
	bridge-utils
	curl
	dhclient
	dnsutils
	dnsmasq
	git
	ifplugd
	inetutils
	ipset
	iptables-nft
	# iw
	# iwd
	mobile-broadband-provider-info
	modemmanager
	# ndisc6
	net-tools
	netctl
	networkmanager
	network-manager-applet
	# networkmanager-l2tp
	networkmanager-openconnect
	networkmanager-openvpn
	networkmanager-pptp
	# networkmanager-qt5
	# networkmanager-strongswan
	networkmanager-vpnc
	nfs-utils
	nmap
	# nm-cloud-setup
	nm-connection-editor
	nss-mdns
	ntp
	openbsd-netcat
	openconnect
	# openresolv
	openssh
	openvpn
	# ppp
	# pptpclient
	# rp-pppoe
	# tcpdump
	# vpnc
	wget
	wireless-regdb
	wireless_tools # Deprecated
	wpa_supplicant
	# wvdial
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

sudo systemctl enable avahi-daemon.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable ntpd.service
sudo systemctl enable sshd.service
sudo systemctl enable wpa_supplicant.service

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
