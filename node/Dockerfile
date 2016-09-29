FROM phusion/baseimage:0.9.19

RUN apt-get update &&\
    apt-get install -y npm &&\
    npm install -g n

ARG node_version

# Add
RUN groupadd -r www-app &&\
    useradd -r -g www-app www-app

# Install the specified node_version or grab latest
RUN n "$node_version"

COPY run-nodock.sh /usr/bin/run-nodock

RUN chmod 700 /usr/bin/run-nodock

WORKDIR /opt/app/
