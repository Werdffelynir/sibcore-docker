#!/bin/sh

if [ -d "$PATH_NODE/data" ]; then

    # remove
    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/bitcore-node/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/bitcore-node/node_modules/bitcore-lib
    fi
    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-lib
    fi
    if [ -d ${PATH_NODE}/node_modules/bitcore-lib ] && [ -d ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-message/node_modules/bitcore-lib ]; then
        rm -Rf ${PATH_NODE}/node_modules/insight-api/node_modules/bitcore-message/node_modules/bitcore-lib
    fi

#    if [ -f ${PATH_NODE}/sibcoin.conf ]; then
#        sed -t 's/rpcuser=.*/rpcuser=sibcoin/g' ./data/bitcoin.conf
#        cd ../ && sed -t 's/rpcuser=.*/rpcuser=sibcoin/g' ./sibcoin/sibcoin.conf
#    fi

    sibcore start

else
    echo "Local source 'livenet' not installed!"
fi

