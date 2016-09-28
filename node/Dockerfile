FROM phusion/baseimage:0.9.19

RUN apt-get update &&\
    apt-get install -y npm &&\
    npm install -g n

ARG node_version

# Install the specified node_version or grab latest
RUN if [ -n "$node_version" ]; then\
        n "$node_version"\
    else\
        n latest\
    ;fi;

WORKDIR /opt/app/
