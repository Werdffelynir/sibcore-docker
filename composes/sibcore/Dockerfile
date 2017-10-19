###################################################
# Base images, with common environment, for sibcoin-docker
###################################################
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install g++ make python git curl tar nano mc findutils libzmq3-dev build-essential

# Main group, user
RUN groupadd sibcore
RUN useradd sibcore -m -s /bin/bash -g sibcore

# Environment variables
ENV HOME "/home/sibcore"
ENV NODE_VERSION "4.8.4"
ENV NVM_DIR "$HOME/.nvm"
ENV PATH ${PATH}":$HOME/.nvm/versions/node/v$NODE_VERSION/bin"

# Change user to main
USER sibcore

WORKDIR ${HOME}

# Install NVM
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Install Node and primary global installation of bitcore via NVM
RUN . ${NVM_DIR}/nvm.sh &&\
    nvm install $NODE_VERSION &&\
    nvm alias default $NODE_VERSION &&\
    npm install git+https://git@github.com/Werdffelynir/bitcore.git -g

# Path to src files
VOLUME ${NVM_DIR}/versions/node/v${NODE_VERSION}/lib/node_modules/bitcore
