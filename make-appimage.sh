#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=1.21.11+b69
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/PaperMC/Paper/refs/heads/main/paper-server/src/main/resources/logo.png
#export DESKTOP=DUMMY
#export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
#export PATH=$JAVA_HOME/bin:$PATH

#archlinux-java set java-25-openjdk
# Deploy dependencies
#quick-sharun /usr/lib/jvm/java-25-openjdk/bin/java -jar /srv/papermc/papermc_server.jar #/usr/lib/jvm/java-25-openjdk/lib/*

#quick-sharun /usr/lib/jvm/java*/* -jar /srv/papermc/papermc_server.jar

quick-sharun \
        ./AppDir/bin/* \
         /usr/lib/jvm/java-25-openjdk/bin/java
chmod +x ./AppDir/bin/papermc.sh

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the app normally quits before that time
# then skip this or check if some flag can be passed that makes it stay open
#quick-sharun --test ./dist/*.AppImage
