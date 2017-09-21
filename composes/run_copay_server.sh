#!/bin/sh

path_src_copay="/var/app/sibcore-docker/src/copay"
path_src_container="/copay"

# Step
docker run -p 3000:3000 \
    -v ${path_src_copay}:${path_src_container} --rm copay:latest

#--name 'copay-server'
#chromium-browser --app http://CONTAINER_NETWORK_IP:3000


# docker run -p 3000:3000 -v /var/app/sibcore-docker/src/copay:/copay copay:latest
# /copay/node_modules/.bin/npm