FROM phusion/baseimage:0.9.19

RUN apt-get update && \
    apt-get install -y npm \
        mysql-client \
        sqlite3 \
        iputils-ping && \
    npm install -g n

##
## Timezone
##

ARG tz=UTC
ENV tz ${tz}
RUN ln -snf /usr/share/zoneinfo/$tz /etc/localtime && echo $tz > /etc/timezone

##
## Node
##

ARG node_version

# Install the specified node_version or grab latest
RUN n "$node_version"

##
## Cron
##

COPY ./crontab /var/spool/cron/crontabs

WORKDIR /opt/app


ENTRYPOINT sleep infinity