###################################################
# Up Testnet Node
###################################################
FROM sibcore:latest

USER root

ADD sibcoin.conf ${HOME}/.sibcore/sibcoin.conf
RUN chown sibcore:sibcore ${HOME}/.sibcore/sibcoin.conf &&\
    chmod +x ${HOME}/.sibcore/sibcoin.conf

ADD start.sh ${HOME}/start.sh
RUN chown sibcore:sibcore ${HOME}/start.sh &&\
    chmod +x ${HOME}/start.sh

USER sibcore

ENV PATH_NODE "/home/sibcore/node"
ENV PATH ${PATH}":/home/sibcore/.nvm/versions/node/v4.8.4/bin:/usr/bin/env"

WORKDIR ${PATH_NODE}
VOLUME ${PATH_NODE}

CMD ${HOME}/start.sh
