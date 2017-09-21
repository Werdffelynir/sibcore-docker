#!/bin/sh

path_src_copay="/var/app/sibcore-docker/src/copay"
path_src_container="/copay"

# Step
docker run -v ${path_src_copay}:${path_src_container} \
    --name copay-watch copay:latest grunt watch

# docker run -v /var/app/sibcore-docker/src/copay:/copay copay:latest grunt watch