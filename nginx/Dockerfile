FROM nginx:1.11

ADD nginx.conf /etc/nginx/
COPY sites/app.template /etc/nginx/templates/

RUN mkdir /etc/nginx/sites-available

RUN rm /etc/nginx/conf.d/default.conf

ARG reverse_proxy_port

ENV REVERSE_PROXY_PORT=$reverse_proxy_port

RUN /bin/bash -c "envsubst < /etc/nginx/templates/app.template > /etc/nginx/sites-available/app.conf"

CMD nginx
