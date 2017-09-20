#!/bin/sh

if [ -d "$PATH_NODE/data" ]; then
    sibcore start
else
    echo "Local source 'src/testnet' node not installed!"
fi


#if [ ! -d "$PATH_NODE/data" ]; then
#    rm -r "$PATH_NODE"
#    sibcore create "$PATH_NODE" --testnet
#    chown sibcore:sibcore -R "$PATH_NODE"
#    chmod 777 -R "$PATH_NODE"
#
#    # install conf
#
#    #
#    sibcore start
#else
#    sibcore start
#fi
