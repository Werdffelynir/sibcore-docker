###################################################
# Copay
###################################################

# use latest Node LTS (Boron)
FROM node:boron

#RUN groupadd sibcore
#RUN useradd sibcore -m -s /bin/bash -g sibcore
#RUN usermod -aG sudo sibcore
#
#ENV HOME /home/sibcore
#
#USER sibcore
#
#WORKDIR ${HOME}
# install Ionic and Cordova
RUN npm i -g ionic
RUN npm i -g cordova
RUN npm i -g bower
RUN npm i -g grunt-cli
RUN npm i -g coffee-script

WORKDIR /copay
VOLUME /copay
#VOLUME ${HOME}/copay

#ADD start.sh ${HOME}/start.sh
ADD start.sh /tmp/__init.sh

EXPOSE 8100 3000

#RUN node -v
#RUN npm -v
#RUN ionic -v
#RUN ls -la
#RUN ls -la /root
#RUN whereis ionic

#CMD sh ${HOME}/start.sh
CMD bash /tmp/__init.sh