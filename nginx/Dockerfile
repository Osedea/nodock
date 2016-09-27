FROM nginx:1.11

ADD nginx.conf /etc/nginx/
COPY sites/*.conf /etc/nginx/sites-available/

RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
