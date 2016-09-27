FROM phusion/baseimage:0.9.19

RUN DEBIAN_FRONTEND=noninteractive

ENV TERM xterm

RUN apt-get update && \
    apt-get install -y --force-yes \
        pkg-config \
        libcurl4-openssl-dev \
        libedit-dev \
        libssl-dev \
        libxml2-dev \
        xz-utils \
        libsqlite3-dev \
        sqlite3 \
        git \
        curl \
        vim \
    && apt-get clean
