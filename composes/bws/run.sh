#!/bin/sh


LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/bitcore-wallet-service"
BWS_CONTAINER_HOME="/home/sibcore/bitcore-wallet-service"


# Step -p 3232:3232 -p 3231:3231 -p 3380:3380 -p 443:443
# docker network create --subnet=172.20.0.0/16 devnet
#  --net devnet --ip 172.20.0.3
#  --net devnet --ip 172.20.0.2

docker run --rm -p 3232:3232 -p 3231:3231 -p 3380:3380 --link bwsdb:bwsdb \
    -v ${LOCAL_SRC_PATH}:${BWS_CONTAINER_HOME} bws:1
