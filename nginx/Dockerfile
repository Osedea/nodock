FROM nginx:1.11

RUN mkdir /etc/nginx/sites-available && rm /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/

COPY scripts /root/scripts/
COPY certs/* /etc/ssl/

COPY sites/*.template /etc/nginx/templates/
COPY sites/*.conf /etc/nginx/sites-available/

ARG web_reverse_proxy_port
ARG web_ssl
ARG self_signed

ENV WEB_REVERSE_PROXY_PORT=$web_reverse_proxy_port
ENV WEB_SSL=$web_ssl
ENV SELF_SIGNED=$self_signed

RUN for template in /etc/nginx/templates/*.template; do\
        envsubst < $template > "/etc/nginx/sites-available/"$(basename $template)".conf"\
    ;done;

RUN /bin/bash /root/scripts/web-ssl.sh

CMD nginx
