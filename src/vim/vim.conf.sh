#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _VIMCONF=1

function vim-install () {
    has vim || return

    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/vim/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_path=${target//dot./.}

        backup ${HOME}/$(basename ${target_path})
        command ln -snf ${target} ${HOME}/$(basename ${target_path})
    done
}

function vim-uninstall () {
    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/vim/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_name=$(basename ${target//dot./.})

        restore ${target_name}
    done
}
