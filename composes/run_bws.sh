#!/bin/sh

BWS_HOME="/var/app/sibcore-docker/src/bitcore-wallet-service"
BWS_CONTAINER_HOME="/home/sibcore/bitcore-wallet-service"

# Step
docker run --rm -p 27017:27017 --name db mongo

# Step
docker run --rm -p 3232:3232 --link db:db -v ${BWS_HOME}:${BWS_CONTAINER_HOME} --name bws bws:latest
