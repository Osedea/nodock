#!/bin/bash

if [ "$WEB_SSL" = "false" ]; then
    rm /etc/nginx/sites-available/node-https.template.conf
else
    if [ "$SELF_SIGNED" = "true" ]; then
        openssl req \
            -new \
            -newkey rsa:4096 \
            -days 1095 \
            -nodes \
            -x509 \
            -subj "/C=FK/ST=Fake/L=Fake/O=Fake/CN=0.0.0.0" \
            -keyout /etc/ssl/privkey.pem \
            -out /etc/ssl/cacert.pem
        chown www-data:www-data /etc/ssl/cert1.pem
        chown www-data:www-data /etc/ssl/privkey1.pem
    fi
    if [ -e /var/certs/cert1.pem ]; then
        cp /var/certs/cert1.pem /etc/ssl/cert1.pem
    fi
    if [ -e /var/certs/privkey1.pem ]; then
        cp /var/certs/privkey1.pem /etc/ssl/privkey1.pem
    fi
fi
