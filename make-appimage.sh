#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=1.21.11+b69
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/PaperMC/Paper/refs/heads/main/paper-server/src/main/resources/logo.png

# Deploy dependencies
#quick-sharun /usr/lib/jvm/java-25-openjdk/bin/java -jar /srv/papermc/papermc_server.jar #/usr/lib/jvm/java-25-openjdk/lib/*

#quick-sharun /usr/lib/jvm/java*/* -jar /srv/papermc/papermc_server.jar

quick-sharun \
        ./AppDir/bin/* \
         /usr/lib/jvm/java-25-openjdk/bin/*
chmod +x ./AppDir/bin/papermc.sh
cp -r /usr/lib/jvm/java-25-openjdk/* ./AppDir/shared/lib/jvm/java-25-openjdk

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the app normally quits before that time
# then skip this or check if some flag can be passed that makes it stay open
#quick-sharun --test ./dist/*.AppImage
