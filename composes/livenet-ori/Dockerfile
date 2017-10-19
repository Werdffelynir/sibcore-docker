###################################################
# Up Livenet Node
###################################################
FROM sibcore:latest

USER root

ADD sibcoin.conf ${HOME}/.sibcoin/sibcoin.conf
RUN chown sibcore:sibcore -R ${HOME}/.sibcoin

ADD start.sh ${HOME}/start.sh
RUN chown sibcore:sibcore ${HOME}/start.sh &&\
    chmod +x ${HOME}/start.sh

USER sibcore

ENV PATH_NODE "/home/sibcore/node"
ENV PATH ${PATH}":/home/sibcore/.nvm/versions/node/v4.8.4/bin"

WORKDIR ${PATH_NODE}
VOLUME ${PATH_NODE}

EXPOSE 1944 1945 3001

CMD ${HOME}/start.sh
