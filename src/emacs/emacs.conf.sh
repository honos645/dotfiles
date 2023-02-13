#!/bin/bash

[[ -n "${_COMMON}" ]] || source ${HOME}/.dotfiles/lib/common.sh 2> /dev/null && readonly _EMACSCONF=1

function emacs-install () {
    dotlink emacs
    emacs --batch -f batch-byte-compile ${HOME}/.emacs.d/init.el
}

function emacs-uninstall () {
    dotunlink emacs
}
