FROM phusion/baseimage:0.9.19

ADD install.sh /opt/scripts/install.sh

RUN apt-get update &&\
    apt-get install -y npm &&\
    npm install -g n

RUN bash /opt/scripts/install.sh

WORKDIR /opt/app/

RUN npm install
