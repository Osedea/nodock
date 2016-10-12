FROM nginx:1.11

RUN mkdir /etc/nginx/sites-available && rm /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/

COPY scripts /root/scripts/
COPY certs/* /etc/ssl/

COPY sites /etc/nginx/templates

ARG WEB_REVERSE_PROXY_PORT
ARG WEB_SSL
ARG SELF_SIGNED
ARG NO_DEFAULT

ENV WEB_REVERSE_PROXY_PORT=$WEB_REVERSE_PROXY_PORT
ENV WEB_SSL=$WEB_SSL
ENV SELF_SIGNED=$SELF_SIGNED
ENV NO_DEFAULT=$NO_DEFAULT

RUN /bin/bash /root/scripts/build-nginx.sh

CMD nginx
