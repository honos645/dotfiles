#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _BASHCONF=1

function bash-install () {
    dotlink bash

    command source ${HOME}/.bash_profile
}

function bash-uninstall () {
    dotunlink bash
}
