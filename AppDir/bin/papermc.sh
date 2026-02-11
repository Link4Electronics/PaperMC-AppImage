#!/bin/sh
exec java -Xms512M -Xmx1024M -Dcom.mojang.eula.agree=true -jar ./AppDir/bin/papermc_server.jar nogui "$@"
