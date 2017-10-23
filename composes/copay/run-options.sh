#!/bin/bash

SCRIPT_ROOT=$(dirname "$(realpath -s $0)")
LOCAL_SRC_PATH="$SCRIPT_ROOT/volumes/copay"

PS3='Please enter your choice: '
options=("Install" "Web Server" "Watcher" "Build Android" "Build IOS" "Build Windows" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            printf "\n\e[92m - Install Copay and run Web Server: \x1b[0m\n"
            source ./install.sh
            ;;
        "Web Server")
            printf "\n\e[92m - Start Copay Web Server: \x1b[0m\n"
            source ./run-server.sh
            ;;
        "Watcher")
            printf "\n\e[92m - Start Copay Watcher: \x1b[0m\n"
            source ./run-watcher.sh
            ;;
        "Build Android")
            printf "\n\e[92m - Build Copay to Android Application: \x1b[0m\n"
            cd ${LOCAL_SRC_PATH}
            npm run clean-all
            npm run apply:copay
            npm run final:android
            ;;
        "Build IOS")
            printf "\n\e[92m - Build Copay to IOS Application: \x1b[0m\n"
            cd ${LOCAL_SRC_PATH}
            npm run clean-all
            npm run apply:copay
            npm run final:ios
            ;;
        "Build Windows")
            printf "\n\e[92m - Build Copay to Windows Application: \x1b[0m\n"
            cd ${LOCAL_SRC_PATH}
            npm run clean-all
            npm run apply:copay
            npm run final:windows
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done









exit


#
#
#LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore-wallet-service"
#BWS_CONTAINER_HOME="/home/sibcore/bitcore-wallet-service"
#
#
## Step -p 3232:3232 -p 3231:3231 -p 3380:3380 -p 443:443
#docker run --rm -p 3232:3232  --link db:db \
#    -v ${LOCAL_SRC_PATH}:${BWS_CONTAINER_HOME} bws:1
