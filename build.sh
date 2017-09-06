#!/bin/sh

A1=$1
A2=$2

if [ "$A1" = "re" ]
then
    echo "Remove last revisions:\n"
    docker rm -f sibcoredocker_sibcore_1 sibcoredocker_sibcore_2 sibcoredocker_sibcore_3 && docker rmi -f sibcoredocker_sibcore
    echo "\nBuild with --force-recreate:\n"
    /home/werd/docker-compose up --force-recreate --build

elif [ "$A1" = "" ]
then
    echo "\nBuild:\n"
    /home/werd/docker-compose up --build
fi

#echo "\nImages list:\n"
#docker images
#
#echo "\nContainers list:\n"
#docker ps -a

if [ "$A1" = "run" ] || [ "$A2" = "run" ]
then
    echo "\nStart:\n"
#    docker start sibcoredocker_sibcore_1
fi
