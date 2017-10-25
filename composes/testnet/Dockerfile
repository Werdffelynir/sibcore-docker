###################################################
# Up Testnet Node
###################################################
FROM sibcore:latest

USER root

ADD sibcoin.conf ${HOME}/.sibcoin/sibcoin.conf
RUN chown sibcore:sibcore ${HOME}/.sibcoin/sibcoin.conf &&\
    chmod +x ${HOME}/.sibcoin/sibcoin.conf

ADD induct.sh ${HOME}/induct.sh
RUN chown sibcore:sibcore ${HOME}/induct.sh &&\
    chmod +x ${HOME}/induct.sh

USER sibcore

ENV PATH_NODE "/home/sibcore/node"
ENV PATH ${PATH}":/home/sibcore/.nvm/versions/node/v4.8.4/bin"

WORKDIR ${PATH_NODE}
VOLUME ${PATH_NODE}

CMD ${HOME}/induct.sh
