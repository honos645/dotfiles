#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _CODECONF=1
function code-install () {
    has code || return

    local TARGETS=$(find  $(readlink -f ${HOME}/.dotfiles/src/code/) -maxdepth 1 -name "dot.*")

    for TARGET in ${TARGETS}; do
        local TARGET_PATH=$(basename ${TARGET//dot./})

        backup ${HOME}/.config/Code/User/$(basename ${TARGET_PATH})

        command ln -snf ${TARGET} ${HOME}/.config/Code/User/$(basename ${TARGET_PATH})
    done

    code --list-extension > ${HOME}/.dotfiles.backup/!${HOME}!.vscode!extensions

    local TARGETS=$(cat ${HOME}/.dotfiles/src/code/extensions)

    for target in ${TAEGETS}; do
        code --install-extension ${target}
    done
}
