#!/bin/bash

[[ -n "${_COMMON}" ]] || source ../../src/install/common.sh 2> /dev/null && readonly _VIMCONF=1

function vim-install () {
    [[ -z "${_VIMCONF}" ]] && command find $(pwd) -maxdepth 1 -name "dot.*" -exec bash -c 'ln -snf ${0} ~/`basename ${0} | sed -e "s/dot//g"`' {} \; && return

    TARGETS=$(find `readlink -f ./modules/vim/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}
    do
    target_path=${target//dot/}

    backup ${target_path}
    command ln -sf ${target} ~/$(basename ${target_path})
    done
}
