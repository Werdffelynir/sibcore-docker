#!/bin/sh

LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore"
CONTAINER_SRC_PATH="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

docker run --rm -it -p 1944:1944 -p 1945:1945 \
    -v ${LOCAL_SRC_PATH}:${CONTAINER_SRC_PATH} \
    sibcore:1
