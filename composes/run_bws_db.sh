#!/bin/sh

BWS_HOME="/var/app/sibcore-docker/src/bitcore-wallet-service"
BWS_CONTAINER_HOME="/home/sibcore/bitcore-wallet-service"

# Step
docker run --rm -p 27017:27017 --name db mongo

