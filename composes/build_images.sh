#!/bin/sh

COMPOSES_HOME="/var/app/sibcore-docker/composes"
BWS_HOME="/var/app/sibcore-docker/src/bitcore-wallet-service"
BITCORE_HOME="/var/app/sibcore-docker/src/bitcore"
BITCORE_NODE_LIVENET_HOME="/var/app/sibcore-docker/src/livenet"
BITCORE_NODE_TESTNET_HOME="/var/app/sibcore-docker/src/testnet"

if [ `node -v` != "v4.8.4" ]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    nvm use v4.8.4
    printf "\n\x1b[31;4m - Used NodeJS version v4.8.4 \x1b[0m\n"
fi

if [ `node -v` == "v4.8.4" ]
then

    # Step Bitcore
    printf "\n\e[92m - Clone bitcore from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/bitcore.git ${BITCORE_HOME}

    # Step
    printf "\n\e[92m - Bitcore installing: \x1b[0m\n"
    cd ${BITCORE_HOME} && npm install

    # Step
    printf "\n\e[92m - Build sibcore docker image: \x1b[0m\n"
    docker build --rm --no-cache -t 'sibcore' ${COMPOSES_HOME}/sibcore

    # Step Livenet
    printf "\n\e[92m - Create source of sibcore node livenet: \x1b[0m\n"
    ${BITCORE_HOME}/bin/bitcore create ${BITCORE_NODE_LIVENET_HOME}

    # Step
    printf "\n\e[92m - Build docker image for sibcore node on livenet: \x1b[0m\n"
    docker build --rm --no-cache -t 'livenet' ${COMPOSES_HOME}/livenet

    # Step Testnet
    printf "\n\e[92m - Create source of sibcore node testnet: \x1b[0m\n"
    ${BITCORE_HOME}/bin/bitcore create ${BITCORE_NODE_TESTNET_HOME} --testnet

    # Step
    printf "\n\e[92m - Build docker image for sibcore node on testnet: \x1b[0m\n"
    docker build --rm --no-cache -t 'testnet' ${COMPOSES_HOME}/testnet

    # Step Bitcore Wallet Service
    printf "\n\e[92m - Clone Bitcore Wallet Service source from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/bitcore-wallet-service.git ${BWS_HOME}

    # Step
    printf "\n\e[92m - Bitcore Wallet Service installing: \x1b[0m\n"
    cd ${BWS_HOME} && npm install

    # Step
    printf "\n\e[92m - Build docker image for bitcore wallet service: \x1b[0m\n"
    docker build --rm --no-cache -t 'bws' ${COMPOSES_HOME}/bws

    # Step
    printf "\n\e[92m - Build docker image for Copay: \x1b[0m\n"
    docker build --rm --no-cache -t 'copay' ${COMPOSES_HOME}/copay

fi

