#!/bin/sh


LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore-wallet-service"
BWS_CONTAINER_HOME="/home/sibcore/bitcore-wallet-service"

# Step
docker run --rm -p 3232:3232 --link db:db -v ${LOCAL_SRC_PATH}:${BWS_CONTAINER_HOME} bws:1
