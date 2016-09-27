#!/bin/bash

if [[ -f /opt/files/package.json ]]; then
  cd /root
  curl -O -s https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh
  bash install.sh > /dev/null
  rm install.sh
  echo 'export NVM_DIR="/root/.nvm"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.bashrc

  NVM_DIR="/root/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

  cd /opt/files/
  nvm install `cat .node-version` 2&> /dev/null
  npm install 2&> /dev/null
fi
