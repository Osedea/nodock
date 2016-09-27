#!/bin/bash

if [[ -n "$NODE_VERSION" ]]; then
    n "$NODE_VERSION"
else
    n latest
fi
