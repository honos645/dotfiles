#!/bin/bash

function backup () {
    [[ $# -eq "0" ]] && return
    [[ -d "${HOME}/${BACKUP_DIR}" ]] || create_backup

    local target=$(readlink -f "${1}")
    command echo ${target}

    [[ -e "${target}" ]] || return
    command diff ${target} ${HOME}/.dotfiles.backup/${target//\/\!} > /dev/null 2>&1 && [[ -L "${target}" ]] && return
    command cp -rdunf ${target} ${HOME}/.dotfiles.backup/${target//\//\!}
}
