#!/bin/bash

set -e

if [[ -f "sdb" ]] ; then
    export PATH="${PATH}:${PWD}"
fi

export FNAME="${1}"

# Ref: lib/langush.sh
if ! command -v "sdb" &> /dev/null ; then
    echo -e "sdb not found, please install it:\nsource: https://github.com/radareorg/sdb.git"
    exit 1
fi

# Set Locale
[[ -z "${SETLOC}" ]] && export SETLOC="${1%%.*}"

locale.setloc() {
    if [[ -n "${1}" ]] ; then
        export SETLOC="${1}"
    fi
}

locale.push() {
    if [[ -n "${1}" ]] && [[ -n "${2}" ]] ; then
        sdb "${SETLOC%%.*}.lang" "${1}"="${2}"
    fi
}


. "${1}"

if [[ -f "${SETLOC}.lang" ]] ; then
    echo "${FNAME} -> ${SETLOC}.lang"
fi
