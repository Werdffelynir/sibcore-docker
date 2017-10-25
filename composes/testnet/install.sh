#!/bin/bash

SCRIPT_ROOT=$(dirname "$(realpath -s $0)")
LOCAL_SRC_PATH="$SCRIPT_ROOT/volumes/testnet"
BITCORE_HOME="$(dirname "$SCRIPT_ROOT")/sibcore/volumes/bitcore"

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
    printf "\n\e[92m - Create source of testnet: \x1b[0m\n"
    ${BITCORE_HOME}/bin/bitcore create ${LOCAL_SRC_PATH} --testnet

    # Patched
    sed -i 's/"exec".*/"exec": "\/home\/sibcore\/.nvm\/versions\/node\/v4.8.4\/lib\/node_modules\/bitcore\/node_modules\/bitcore-node\/bin\/bitcoind"/g' ${LOCAL_SRC_PATH}/bitcore-node.json

    # Add insight block explorer
    if [ ! -f ${LOCAL_SRC_PATH}/node_modules/insight-ui ]
    then
#        sed -i 's/rpcuser=.*/rpcuser=sibcoin/g' ${LOCAL_SRC_PATH}/data/bitcoin.conf
        sed -i 's/"web".*/"web", "insight-api", "insight-ui"/g' ${LOCAL_SRC_PATH}/bitcore-node.json
        sed -i 's/bitcore-node.git".*/bitcore-node.git", "insight-api": "git+https:\/\/git@github.com\/Werdffelynir\/insight-api.git", "insight-ui": "git+https:\/\/git@github.com\/Werdffelynir\/insight-ui.git"/g' ${LOCAL_SRC_PATH}/package.json
        cd ${LOCAL_SRC_PATH} && npm install && cd ${SCRIPT_ROOT}
    fi

    # Build
    printf "\n\e[92m - Build docker image for testnet: \x1b[0m\n"
    docker build --rm -t 'testnet:1' .

fi
