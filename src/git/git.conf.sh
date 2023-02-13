#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _GITCONF=1

function git-install () {
    has git || return

    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/git/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_path=${target//dot./.}

        backup ${HOME}/$(basename ${target_path})
        command ln -snf ${target} ${HOME}/$(basename ${target_path})
    done
}
