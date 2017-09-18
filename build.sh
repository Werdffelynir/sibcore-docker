#!/bin/sh

#docker build --no-cache -t 'sib-base' .
#docker build --no-cache -t 'sib-core' .
docker build --rm -t 'sib-base' .
docker build --rm -t 'sib-core' .

--------------------------------------------------
docker build --rm -t 'sib-core' .
docker run -it -v /var/app/sibcore-docker/apps/bitcore:/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore sib-base:latest
docker run -it -v /var/app/sibcore-docker/apps/livenet:/home/sibcore/node sib-livenet:latest

docker exec -it 555286d6506e /bin/bash -c "export TERM=xterm; exec bash"

docker-compose up --build /
docker run -it -v /var/app/sibcore-docker/apps/bitcore:/home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore sib-core bash
docker run -it sib-base
# npm i

VOLUME /home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore
/home/werd/.nvm/versions/node/v4.8.4/bin

Try sudo PATH="$PATH:/usr/local/bin" npm install -g


#A1=$1
#A2=$2
#
#if [ "$A1" = "re" ]
#then
#    echo "Remove last revisions:\n"
#    docker rm -f sibcoredocker_sibcore_1 sibcoredocker_sibcore_2 sibcoredocker_sibcore_3 && docker rmi -f sibcoredocker_sibcore
#    echo "\nBuild with --force-recreate:\n"
#    /home/werd/docker-compose up --force-recreate --build
#
#elif [ "$A1" = "" ]
#then
#    echo "\nBuild:\n"
#    /home/werd/docker-compose up --build
#fi
#
##echo "\nImages list:\n"
##docker images
##
##echo "\nContainers list:\n"
##docker ps -a
#
#if [ "$A1" = "run" ] || [ "$A2" = "run" ]
#then
#    echo "\nStart:\n"
##    docker start sibcoredocker_sibcore_1
#fi
