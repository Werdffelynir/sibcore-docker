###################################################
#
###################################################
FROM node:8

ENV PROOT /home/sibcore

RUN groupadd sibcore
RUN useradd sibcore -m -s /bin/bash -g sibcore

USER sibcore

RUN apt-get update
RUN apt-get instal -y g++ make python git curl tar findutils libzmq3-dev build-essential

WORKDIR $PROOT

RUN git clone https://github.com/Werdffelynir/copay.git ./copay