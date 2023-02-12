#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _BASHCONF=1

function bash-install () {
    has bash || return

    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/bash/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_path=${target//dot./.}

        backup ${HOME}/$(basename ${target_path})
        command ln -snf ${target} ${HOME}/$(basename ${target_path})
    done

    command source ${HOME}/.bash_profile
}
