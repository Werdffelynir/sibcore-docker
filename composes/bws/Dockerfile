###################################################
# Create Bitcore Wallet Service docker images
###################################################
FROM sibcore:1

USER root

ENV PATH_BWS "/home/sibcore/bitcore-wallet-service"
RUN mkdir -p ${PATH_BWS}
RUN chown sibcore:sibcore -R ${PATH_BWS}

USER sibcore

WORKDIR ${PATH_BWS}
VOLUME ${PATH_BWS}

EXPOSE 3232 3231 3380 443

CMD npm stop &&\
    npm start &&\
    tail -f logs/bws.log
