#!/bin/sh

COPAY_HOME="/var/app/sibcore-docker/src/copay"
COPAY_CONTAINER_HOME="/copay"

# Step
docker run --rm -ti copay npm run watch
