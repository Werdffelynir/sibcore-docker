#!/bin/sh

NODE_HOME="/var/app/sibcore-docker/src/livenet"
BITCORE_HOME="/var/app/sibcore-docker/src/bitcore"
NODE_CONTAINER_HOME="/home/sibcore/node"
BITCORE_CONTAINER_HOME="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

# Step
docker run --rm -it -p 1945:1945 -p 1944:1944 -p 8333:8333 -p 8332:8332 -p 3001:3001 \
    -v ${NODE_HOME}:${NODE_CONTAINER_HOME} \
    -v ${BITCORE_HOME}:${BITCORE_CONTAINER_HOME} \
    livenet:latest
