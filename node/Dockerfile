FROM phusion/baseimage:0.9.19

RUN apt-get update

ADD scripts/ /opt/scripts/
ADD files/ /opt/files/

RUN bash /opt/scripts/npm_install.sh
