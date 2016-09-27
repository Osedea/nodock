#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm "$SCRIPT_DIR"/../node/files/package.json
rm "$SCRIPT_DIR"/../node/files/.node-version
