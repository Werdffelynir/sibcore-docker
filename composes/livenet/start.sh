#!/bin/sh

if [ -d "$PATH_NODE/data" ]; then
    sibcore start
else
    echo "Local source 'src/livenet' node not installed!"
fi
