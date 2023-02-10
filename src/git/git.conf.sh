#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _GITCONF=1

function git-install () {
    [[ -z "${_GITCONF}" ]] && command find $(pwd) -maxdepth 1 -name "dot.*" -exec bash -c 'ln -snf ${0} ${HOME}/`basename ${0} | sed -e "s/dot//g"`' {} \; && return

    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/git/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_path=${target//dot/}

        backup ${target_path}
        command ln -snf ${target} ${HOME}/$(basename ${target_path})
        command echo "ln -snf ${target} ${HOME}/$(basename ${target_path})"
    done
}
