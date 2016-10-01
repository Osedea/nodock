FROM nginx:1.11

RUN mkdir /etc/nginx/sites-available && rm /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/

COPY scripts /root/scripts/
COPY certs/* /etc/ssl/

COPY sites /etc/nginx/templates

ARG web_reverse_proxy_port
ARG web_ssl
ARG self_signed
ARG no_default

ENV WEB_REVERSE_PROXY_PORT=$web_reverse_proxy_port
ENV WEB_SSL=$web_ssl
ENV SELF_SIGNED=$self_signed
ENV NO_DEFAULT=$no_default

RUN /bin/bash /root/scripts/build-nginx.sh

CMD nginx
