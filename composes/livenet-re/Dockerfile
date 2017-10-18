###################################################
# Up Livenet Node
###################################################
FROM sibcore:1

USER root

ADD sibcoin.conf ${HOME}/.sibcoin/sibcoin.conf
RUN chown sibcore:sibcore -R ${HOME}/.sibcoin

ADD induct.sh ${HOME}/induct.sh
RUN chown sibcore:sibcore ${HOME}/induct.sh &&\
    chmod +x ${HOME}/induct.sh

USER sibcore

ENV PATH_NODE "/home/sibcore/node"

WORKDIR ${PATH_NODE}
VOLUME ${PATH_NODE}

EXPOSE 1944 1945 3001

CMD ${HOME}/induct.sh
