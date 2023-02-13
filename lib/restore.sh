#!/bin/bash

function restore () {
    [[ $# -eq "0" ]] && return
    [[ -d "${HOME}/${BACKUP_DIR}" ]] || create_backup

    local TARGET=${1}

    [[ -e "${HOME}/.dotfiles.backup/${TARGET//\//\!}" ]] || return
    command cp -rdnf ${HOME}/.dotfiles.backup/${TARGET//\//\!} ${TARGET}
}
