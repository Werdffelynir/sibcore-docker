#!/bin/sh

LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore"

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

    # Step - create docker image
    printf "\n\e[92m * Create docker image from 'composes/sibcoin': \x1b[0m\n"
    docker build --rm -t 'sibcore:1' .

    # Step clone src local dir
    printf "\n\e[92m * Clone bitcore from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/bitcore.git ${LOCAL_SRC_PATH}

    # Step install src to local dir
    printf "\n\e[92m * Bitcore installing: \x1b[0m\n"
    cd ${LOCAL_SRC_PATH} && npm install
fi
