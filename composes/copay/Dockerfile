FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive \
    ANDROID_HOME=/opt/android-sdk-linux \
    NPM_VERSION=4.4.4 \
    IONIC_VERSION=3.3.0 \
    CORDOVA_VERSION=6.5.0 \
    YARN_VERSION=0.24.6 \
    DBUS_SESSION_BUS_ADDRESS=/dev/null \
    SOURCE_DIR=/copay

# Install basics
RUN apt-get update
RUN apt-get install -y git wget curl unzip ruby build-essential
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

RUN npm install -g cordova@${CORDOVA_VERSION}
RUN npm install -g ionic@${IONIC_VERSION}
RUN npm install -g yarn@${YARN_VERSION}
RUN npm cache clear

RUN apt-get install ruby-dev -y
RUN gem install sass scss_lint

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&\
    dpkg --unpack google-chrome-stable_current_amd64.deb &&\
    apt-get install -f -y &&\
    apt-get clean &&\
    rm google-chrome-stable_current_amd64.deb

RUN mkdir ${SOURCE_DIR}
RUN mkdir -p /root/.cache/yarn/

# Font libraries
RUN apt-get -qqy install fonts-ipafont-gothic xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable libfreetype6 libfontconfig

# install python-software-properties (you can do add-apt-repository)
RUN apt-get update && apt-get install -y -q python-software-properties software-properties-common
RUN add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" -y
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && apt-get -y install oracle-java8-installer

# System libs for android enviroment
RUN echo ANDROID_HOME="${ANDROID_HOME}" >> /etc/environment
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y --force-yes expect ant wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 qemu-kvm kmod
RUN apt-get clean
RUN apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Android Tools
RUN mkdir /opt/android-sdk-linux
RUN cd /opt/android-sdk-linux &&\
    wget --output-document=android-tools-sdk.zip --quiet https://dl.google.com/android/repository/tools_r25.2.3-linux.zip &&\
    unzip -q android-tools-sdk.zip &&\
    rm -f android-tools-sdk.zip
RUN chown -R root. /opt

# Setup environment
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

#RUN npm install gulp gulp-sass -g
RUN mkdir ${ANDROID_HOME}/licenses
RUN echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > ${ANDROID_HOME}/licenses/android-sdk-license
RUN echo 84831b9409646a918e30573bab4c9c91346d8abd > ${ANDROID_HOME}/licenses/android-sdk-preview-license

# Install and Update Android SDK using sdkmanager
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "tools" "platform-tools"
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "build-tools;25.0.3" "build-tools;25.0.2"
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "platforms;android-26" "platforms;android-25" "platforms;android-24" "platforms;android-23"
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;android;m2repository" "extras;google;m2repository"
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"
RUN yes Y | ${ANDROID_HOME}/tools/bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2"
RUN cordova telemetry off

# ReInstall NPM
RUN curl -L https://npmjs.org/install.sh | npm_install=${NPM_VERSION} bash

# Needed for Copay
RUN mkdir -p /root/.ionic && touch /root/.ionic/daemon.log

# Install Gradle builder, or gradle-3.3-all.zip
RUN wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip &&\
    mkdir /opt/gradle &&\
    unzip -d /opt/gradle gradle-3.4.1-bin.zip

ENV PATH ${PATH}:/opt/gradle/gradle-3.4.1/bin

# Install Bower
RUN npm install bower -g

WORKDIR ${SOURCE_DIR}

EXPOSE 8100 35729

CMD npm run clean-all && bower install --allow-root && npm run apply:copay && npm start

# && bower install --allow-root
#CMD npm run clean-all && npm run apply:copay && npm start
#CMD npm run clean-all && npm run apply:copay && npm run --force final:android
 # && bower install --allow-root

#CMD npm start
#CMD npm run --force final:android


