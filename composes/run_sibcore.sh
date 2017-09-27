#!/bin/sh

BITCORE_HOME="/var/app/sibcore-docker/src/bitcore"
BITCORE_CONTAINER_HOME="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

# Step
docker run --rm -it -v ${BITCORE_HOME}:${BITCORE_CONTAINER_HOME} sibcore:latest
