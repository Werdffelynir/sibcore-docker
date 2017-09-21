#!/bin/sh

path_composes="/var/app/sibcore-docker/composes"

path_src_bws="/var/app/sibcore-docker/src/bitcore-wallet-service"
path_src_bitcore="/var/app/sibcore-docker/src/bitcore"
path_src_node_livenet="/var/app/sibcore-docker/src/livenet"
path_src_node_testnet="/var/app/sibcore-docker/src/testnet"

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
    git clone https://github.com/Werdffelynir/bitcore.git ${path_src_bitcore}

    # Step
    printf "\n\e[92m - Bitcore installing: \x1b[0m\n"
    cd ${path_src_bitcore} && npm install

    # Step
    printf "\n\e[92m - Build sibcore docker image: \x1b[0m\n"
    docker build --rm --no-cache -t 'sibcore' ${path_composes}/sibcore

    # Step Livenet
    printf "\n\e[92m - Create source of sibcore node livenet: \x1b[0m\n"
    ${path_src_bitcore}/bin/bitcore create ${path_src_node_livenet}

    # Step
    printf "\n\e[92m - Build docker image for sibcore node on livenet: \x1b[0m\n"
    docker build --rm --no-cache -t 'livenet' ${path_composes}/livenet

    # Step Testnet
    printf "\n\e[92m - Create source of sibcore node testnet: \x1b[0m\n"
    ${path_src_bitcore}/bin/bitcore create ${path_src_node_testnet} --testnet

    # Step
    printf "\n\e[92m - Build docker image for sibcore node on testnet: \x1b[0m\n"
    docker build --rm --no-cache -t 'testnet' ${path_composes}/testnet

    # Step Bitcore Wallet Service
    printf "\n\e[92m - Clone Bitcore Wallet Service source from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/bitcore-wallet-service.git ${path_src_bws}

    # Step
    printf "\n\e[92m - Bitcore Wallet Service installing: \x1b[0m\n"
    cd ${path_src_bws} && npm install

    # Step
    printf "\n\e[92m - Build docker image for bitcore wallet service: \x1b[0m\n"
    docker build --rm --no-cache -t 'bws' ${path_composes}/bws

fi

