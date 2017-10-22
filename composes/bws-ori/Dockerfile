###################################################
# Create Bitcore Wallet Service docker images
###################################################
FROM sibcore:latest

USER root

ADD start.sh ${HOME}/start.sh
RUN chown sibcore:sibcore ${HOME}/start.sh &&\
    chmod +x ${HOME}/start.sh

ENV PATH_BWS "/home/sibcore/bitcore-wallet-service"
RUN mkdir -p ${PATH_BWS}
RUN chown sibcore:sibcore -R ${PATH_BWS}

USER sibcore

ENV PATH ${PATH}":/home/sibcore/.nvm/versions/node/v4.8.4/bin:/usr/bin/env"

WORKDIR ${PATH_BWS}
VOLUME ${PATH_BWS}

EXPOSE 3232 3231 3380 443

CMD npm stop &&\
    npm start &&\
    tail -f logs/bws.log
