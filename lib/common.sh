#!/bin/bash

readonly _COMMON=1

function has () {
    command type $1 > /dev/null 2>&1
}

function create_backup () {
    command mkdir -p ~/.dotfiles.backup
}

function backup () {
    [[ $# -eq 0 ]] && return 
    [[ -d ~/.dotfiles.backup ]] || create_backup

    backup_target=$(basename ${1})
    [[ -e "~/${backup_target}" ]] || return
    diff ${backup_target} ~/${backup_target}gc > /dev/null 2>&1 && [[ -L "${backup_target}" ]] && return
    command cp -rdunf ~/${backup_target}gc ~/.dotfiles.backup/$(readlink -f ${1} | sed -e 's/\//!/g')

}
