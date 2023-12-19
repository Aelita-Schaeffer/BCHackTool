#!/bin/bash

set -e

# Defaults
export TOOLS=(
    "https://github.com/radareorg/sdb"
)

# Check git
if ! command -v "git" &> /dev/null ; then
    echo "command \"git\" not found, please install it."
    exit 1
fi

[[ -d "tools" ]] || mkdir -p "tools"

# Simple/String DataBase
for tool in "${TOOLS[@]}" ; do
    if [[ -d "tools/${tool##*/}" ]] ; then
        echo "${tool##*/} -> found."
    else
        git clone "${tool}" "tools/${tool##*/}"
    fi
done