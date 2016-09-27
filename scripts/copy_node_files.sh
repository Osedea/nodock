#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp "$SCRIPT_DIR"/../../package.json "$SCRIPT_DIR"/../node/files/package.json
cp "$SCRIPT_DIR"/../../.node-version "$SCRIPT_DIR"/../node/files/.node-version
