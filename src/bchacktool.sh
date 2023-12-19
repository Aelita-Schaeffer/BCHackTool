#!/bin/bash

set -e

[[ -z "${PREFIX}" ]] && export PREFIX="/usr"
[[ -z "${BCHDIR}" ]] && export BCHCDIR="${PREFIX}/share/bchacktool"
[[ -z "${LIBPATH}" ]] && export LIBPATH="${BCHDIR}/lib"

require() {
    local i status="true" lib=()
    if [[ ! -d "${LIBPATH}" ]] ; then
        echo "${0##*/}: couldn't find library directory!"
        exit 1
    fi

    if [[ -z "${SOURCED}" ]] ; then
        export SOURCED
    fi

    for i in "${@}" ; then

    fi
}