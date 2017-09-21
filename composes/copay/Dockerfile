###################################################
# Copay
###################################################
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install g++ make python git curl tar nano mc

RUN groupadd sibcore
RUN useradd sibcore -m -s /bin/bash -g sibcore

ENV HOME "/home/sibcore"
ENV NODE_VERSION "6.10.3"
ENV NVM_DIR "/home/sibcore/.nvm"

#ADD start.sh ${HOME}/start.sh
#RUN chown sibcore:sibcore ${HOME}/start.sh &&\
#    chmod +x ${HOME}/start.sh

USER sibcore

WORKDIR ${HOME}

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

RUN . ${NVM_DIR}/nvm.sh &&\
    nvm install $NODE_VERSION &&\
    nvm alias default $NODE_VERSION &&\
    npm install -g grunt-cli bower

ENV PATH ${PATH}":/home/sibcore/.nvm/versions/node/v${NODE_VERSION}/bin"

ADD start.sh ${HOME}/start.sh

VOLUME ${HOME}/copay

CMD bash ${HOME}/start.sh

