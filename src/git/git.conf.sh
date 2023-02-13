#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _GITCONF=1

function git-install () {
    dotlink git
}

function git-uninstall () {
    dotunlink git
}
