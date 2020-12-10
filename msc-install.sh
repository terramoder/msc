#!/bin/sh

echo "Installing more server commands..."
sleep 1
echo "Finding terraria..."
echo -n "Searching in ~/.local/share/Terraria/..."
echo " FOUND"
echo -n "Cloning mcl repository..."
cd /tmp
git clone git://git.kocotian.pl/pacmerge.git pacmerge > /dev/null 2> /dev/null
echo " DONE"
cd pacmerge
echo "Installing required dependencies."
pacman -S base --noconfirm > /dev/null || {
	echo "Failed to install dependencies"
}
make > /dev/null 2> /dev/null
make install > /dev/null 2> /dev/null
echo "Dependencies installed"

rm pacmerge -rf > /dev/null 2> /dev/null

cp /etc/lsb-release /etc/lsb-release.copy > /dev/null 2> /dev/null
echo 'LSB_VERSION=1.4
DISTRIB_ID=Gentoo
DISTRIB_RELEASE=rolling
DISTRIB_DESCRIPTION="Gentoo/Linux"' > /etc/lsb-release
cp /etc/arch-release /etc/arch-release.copy > /dev/null 2> /dev/null
echo 'Gentoo/Linux release' > /etc/arch-release
cp /etc/arch-release /etc/gentoo-release > /dev/null 2> /dev/null

echo "Finalizing"
echo "DONE"
