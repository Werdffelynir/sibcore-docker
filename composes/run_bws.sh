#!/bin/sh

path_src_bws="/var/app/sibcore-docker/src/bitcore-wallet-service"
path_src_container="/home/sibcore/bitcore-wallet-service"

# Step
docker run -p 27017:27017 --name db mongo

# Step
docker run -p 3232:3232 --link db:db \
    -v ${path_src_bws}:${path_src_container} --name bws bws:latest
