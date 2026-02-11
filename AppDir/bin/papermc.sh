#!/bin/sh
exec java -Xms512M -Xmx1024M -Dcom.mojang.eula.agree=true -jar $HOME/.local/share/papermc/papermc_server.jar nogui "$@"
