#!/bin/sh

if [ -d "$PATH_NODE/data" ]; then

    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/bitcore-node/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/bitcore-node/node_modules/bitcore-lib
    fi
    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-lib
    fi
    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-message/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-message/node_modules/bitcore-lib
    fi

    sibcore start

else
    echo "Local source 'src/livenet' node not installed!"
fi