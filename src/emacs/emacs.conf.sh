#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _EMACSCONF=1

function emacs-install () {
    has emacs || return

    local TARGETS=$(find `readlink -f ${HOME}/.dotfiles/src/emacs/` -maxdepth 1 -name "dot.*")

    for target in ${TARGETS}; do
        local target_path=${target//dot/.}

        backup ${HOME}/$(basename ${target_path})
        command ln -snf ${target} ${HOME}/$(basename ${target_path})
    done

    #emacs --batch -f batch-byte-compile ${HOME}/.emacs.d/init.el
}
