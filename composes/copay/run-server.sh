#!/bin/bash

SCRIPT_ROOT=$(dirname "$(realpath -s $0)")
LOCAL_SRC_PATH="$SCRIPT_ROOT/volumes/copay"

docker run --rm -ti -v ${LOCAL_SRC_PATH}:/copay:rw copay npm start
