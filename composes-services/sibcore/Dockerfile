###################################################
#
###################################################
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install g++ make python git curl tar nano mc findutils libzmq3-dev build-essential

RUN groupadd sibcore
RUN useradd sibcore -m -s /bin/bash -g sibcore

ENV HOME /home/sibcore
ENV NODE_VERSION 4.8.4
ENV NVM_DIR ${HOME}/.nvm

USER sibcore

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

RUN . ${NVM_DIR}/nvm.sh &&\
    nvm install $NODE_VERSION &&\
    nvm alias default $NODE_VERSION
#     &&\
#    npm install git+https://git@github.com/Werdffelynir/bitcore.git -g

# VOLUME ${NVM_DIR}/versions/node/v${NODE_VERSION}/lib/node_modules/bitcore/
# VOLUME /home/sibcore/.nvm/versions/node/v4.8.4/lib/node_modules/bitcore/

