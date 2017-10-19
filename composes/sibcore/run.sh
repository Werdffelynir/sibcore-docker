#!/bin/sh

LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore"
CONTAINER_SRC_PATH="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

# Start image
docker run --rm -it \
    -v ${LOCAL_SRC_PATH}:${CONTAINER_SRC_PATH} \
    sibcore:1
