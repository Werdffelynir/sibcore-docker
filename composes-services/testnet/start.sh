#!/bin/sh

if [ ! -d "$PATH_NODE" ]; then
    sibcore create ${PATH_NODE} -testnet
fi

sibcore start

# install conf

#