FROM phusion/baseimage:0.9.19

RUN apt-get update && \
    apt-get install -y npm \
        mysql-client \
        sqlite3 \
        iputils-ping && \
    npm install -g n

ARG node_version

##
## Node
##

# Install the specified node_version or grab latest
RUN n "$node_version"

##
## Cron
##

COPY ./crontab /var/spool/cron/crontabs

WORKDIR /opt/app
