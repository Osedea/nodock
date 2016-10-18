#!/bin/bash

SCRIPT="$1"

if [[ ${PROJECT_PATH:0:1} = "/" ]]; then
    export PROJECT_PATH=$PROJECT_PATH
else
    export PROJECT_PATH="/opt/app/"$PROJECT_PATH
fi

cd $PROJECT_PATH

if [[ $YARN = true ]]; then
    yarn install
else
    npm install
fi

su -c "cd $PROJECT_PATH; $SCRIPT" -s /bin/bash www-app
