#!/bin/sh

NODE_HOME="/var/app/sibcore-docker/src/testnet"
BITCORE_HOME="/var/app/sibcore-docker/src/bitcore"
NODE_CONTAINER_HOME="/home/sibcore/node"
BITCORE_CONTAINER_HOME="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

# Step
docker run --rm -it -P \
    -v ${NODE_HOME}:${NODE_CONTAINER_HOME} \
    -v ${BITCORE_HOME}:${BITCORE_CONTAINER_HOME} \
    livenet:latest
