#!/bin/sh

COPAY_HOME="/var/app/sibcore-docker/src/copay"
COPAY_CONTAINER_HOME="/copay"

# Step
docker run --rm -ti -v ${COPAY_HOME}:${COPAY_CONTAINER_HOME}:rw copay npm start