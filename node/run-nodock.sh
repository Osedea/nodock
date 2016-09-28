#!/bin/bash

SCRIPT="$1"

cd /opt/app/

npm install > /dev/null

su -c "$SCRIPT" -s /bin/bash www-app
