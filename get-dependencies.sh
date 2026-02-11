#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    wget \
    jre-openjdk-headless #java-runtime-headless

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package papermc
#mv -v /srv/papermc/* ./AppDir/bin

# If the application needs to be manually built that has to be done down here
archlinux-java status
archlinux-java set java-25-openjdk
wget --retry-connrefused --tries=30 "https://api.papermc.io/v2/projects/paper/versions/1.21.11/builds/69/downloads/paper-1.21.11-69.jar" -O ./AppDir/bin/papermc_server.jar
# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
