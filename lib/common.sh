#!/bin/bash

[[ -n "${_COMMON}" ]] || source "$(dirname ${0})/lib/init.sh" && readonly _COMMON=1

function has () {
    command type $1 > /dev/null 2>&1
}

function create_backup () {
    command ln -snf ${TOP_DIR}/ ${HOME}/.dotfiles
    command mkdir -p ${HOME}/.dotfiles.backup
}

function backup () {
    [[ $# -eq "0" ]] && return
    [[ -d "${HOME}/${BACKUP_DIR}" ]] || create_backup

    local target=${1}
    command echo ${target}

    [[ -e "${target}" ]] || return
    #command diff ${target} ${HOME}/${target} > /dev/null 2>&1 && [[ -L "${target}" ]] && return

    command cp -rdunf ${target} ${HOME}/.dotfiles.backup/$(readlink -f ${1} | sed -e 's/\//!/g')
    command echo "cp -rdunf ${target} ${HOME}/.dotfiles.backup/$(readlink -f ${1} | sed -e 's/\//!/g')"

}
