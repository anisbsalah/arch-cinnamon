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
echo "> Installation of System Utilities"
echo "######################################################################################################"
tput sgr0

list=(
	### Documentation ----------------------------------------------------
	man-db
	man-pages
	texinfo
	### Archiving & compression ------------------------------------------
	arj
	cabextract
	file-roller
	gzip
	lzop
	p7zip
	sharutils
	unace
	unarchiver
	unrar
	unzip
	xz
	zip
	zstd
	### Disks ------------------------------------------------------------
	btrfs-progs
	cifs-utils
	# cryfs
	dosfstools
	e2fsprogs
	exfat-utils
	# encfs
	# filelight
	fuse2
	fuse3
	fuseiso
	# gocryptfs
	gpart
	gparted
	gvfs
	gvfs-afc
	gvfs-gphoto2
	gvfs-mtp
	gvfs-nfs
	gvfs-smb
	ifuse
	mtools
	mtpfs
	nfs-utils
	nilfs-utils
	ntfs-3g
	os-prober
	# partclone
	# partimage
	squashfs-tools
	sshfs
	udiskie
	udisks2
	usbutils
	uudeview
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
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
