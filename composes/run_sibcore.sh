#!/bin/sh

path_src_bitcore="/var/app/sibcore-docker/src/bitcore"
path_src_container="/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore"

# Step
docker run -it -v "$path_src_bitcore:$path_src_container" sibcore:latest
