#!/bin/sh

SCRIPT_ROOT=$(dirname "$(realpath -s $0)")
NODE_HOME="$SCRIPT_ROOT/volumes/livenet"
BITCORE_HOME="$(dirname "$SCRIPT_ROOT")/sibcore/volumes/bitcore"

NODE_CONTAINER_HOME="/home/sibcore/node"
BITCORE_CONTAINER_HOME="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

if [ ! -d ${NODE_HOME}/node_modules/insight-api ]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    nvm use v4.8.4
    cd ${NODE_HOME} && npm install
fi

# Step
docker run --rm -it -p 1945:1945 -p 1944:1944 -p 3001:3001 \
    -p 3232:3232 -p 3231:3231 -p 3380:3380 --link bwsdb:bwsdb \
    -v ${NODE_HOME}:${NODE_CONTAINER_HOME} \
    -v ${BITCORE_HOME}:${BITCORE_CONTAINER_HOME} \
    livenet:1
