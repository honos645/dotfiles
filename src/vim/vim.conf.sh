#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _VIMCONF=1

function vim-install () {
    dotlink vim
}

function vim-uninstall () {
    dotunlink vim
}
