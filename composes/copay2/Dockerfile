###################################################
# Copay
###################################################

FROM node:6.7.0

RUN git clone https://github.com/Werdffelynir/copay.git /copay

WORKDIR /copay

RUN npm install -g grunt-cli bower

RUN echo 'y' | bower install --allow-root

#RUN npm run apply:copay
RUN npm install
RUN grunt

ADD start.sh /tmp/__init.sh

#VOLUME /copay

EXPOSE 8100 3000

CMD ["npm", "start"]

#CMD bash /tmp/__init.sh








#
#FROM dockerfile/nodejs-bower-grunt
#RUN apt-get install -y build-essential
#RUN mkdir /opt/copay
#WORKDIR /opt/copay
#RUN \
#    curl -s -L https://github.com/justcoin/copay/tarball/master | tar zx -C /opt/copay/ --strip-components=1 && \
#    npm install && \
#    bower install --production --force --allow-root --config.interactive=false && \
#    grunt
#EXPOSE 80
#CMD PORT=80 npm start
















# use latest Node LTS (Boron) :boron
#RUN node -v
#RUN npm -v
#RUN ionic -v
#RUN ls -la
#RUN ls -la /root
#RUN whereis ionic
# dependencies

#ADD start.sh ${HOME}/start.sh
#RUN npm install
#RUN grunt
#RUN groupadd sibcore
#RUN useradd sibcore -m -s /bin/bash -g sibcore
#RUN usermod -aG sudo sibcore
#
#ENV HOME /home/sibcore
#
#USER sibcore

#RUN git clone https://github.com/bitpay/copay.git /copay

#VOLUME /copay
# install grunt
#RUN echo 'y' | bower install --allow-root

#WORKDIR ${HOME}
# install Ionic and Cordova
#RUN npm i -g ionic
#RUN npm i -g cordova
#RUN npm i -g grunt-cli
#RUN npm i -g bower
#RUN npm i -g coffee-script
#RUN npm i -g node-sass

#VOLUME ${HOME}/copay

#CMD sh ${HOME}/start.sh

