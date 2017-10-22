#!/bin/sh

BITCORE_PATH="/var/app/sibcore-docker/src/bitcore"
LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/livenet"

if [ `node -v` != "v4.8.4" ]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    printf "\n\x1b[31;4m * Try change NodeJS version to v4.8.4 \x1b[0m\n"
    nvm use v4.8.4
fi

if [ `node -v` == "v4.8.4" ]
then

    # Step Livenet
    printf "\n\e[92m - Create source of livenet: \x1b[0m\n"
    ${BITCORE_PATH}/bin/bitcore create ${LOCAL_SRC_PATH}

    # Step
    printf "\n\e[92m - Build docker image for livenet: \x1b[0m\n"
    docker build --rm -t 'livenet:1' .

fi
