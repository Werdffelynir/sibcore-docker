#!/bin/sh

if [ ! -d "$PATH_NODE" ]; then
    sibcore create ${PATH_NODE}
fi

sibcore start