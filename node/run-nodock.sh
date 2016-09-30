#!/bin/bash

SCRIPT="$1"

cd /opt/app/

npm install

su -c "$SCRIPT" -s /bin/bash www-app
