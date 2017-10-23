#!/bin/bash


LOCAL_SRC_PATH="$(dirname "$(realpath -s $0)")/volumes/copay"

if [ `node -v` != "v8.5.0" ]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    printf "\n\x1b[31;4m * Try change NodeJS version to v8.5.0 \x1b[0m\n"
    nvm use v4.4.4
fi

if [ `node -v` == "v8.5.0" ]
then

    # Step Bitcore Wallet Service
    printf "\n\e[92m - Clone Copay source from github: \x1b[0m\n"
    git clone https://github.com/Werdffelynir/copay.git ${LOCAL_SRC_PATH}

    # Copay build
    printf "\n\e[92m - Build docker image for Copay: \x1b[0m\n"
    docker build --rm -t 'copay' .

    # Copay setup
    printf "\n\e[92m - Install Copay: \x1b[0m\n"
    docker run --rm -ti -v ${LOCAL_SRC_PATH}:/copay:rw copay

fi
