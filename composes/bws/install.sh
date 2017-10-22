#!/bin/sh


LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore-wallet-service"

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

    # Step Bitcore Wallet Service
    printf "\n\e[92m - Clone Bitcore Wallet Service source from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/bitcore-wallet-service.git ${LOCAL_SRC_PATH}

    printf "\n\e[92m - Bitcore Wallet Service installing: \x1b[0m\n"
    cd ${LOCAL_SRC_PATH} && npm install

    printf "\n\e[92m - Build docker image for bitcore wallet service: \x1b[0m\n"
    cd ../../ && docker build --rm -t 'bws:1' .

fi
