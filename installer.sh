#!/bin/bash

readonly isInstalled=$(test -e "${HOME}/.local/bin/dotfiles-ctl")
readonly isdotfiles=$(test -e "$(dirname ${0})/bin/dtofiles-ctl")

if [ ! "${isInstalled}" ]; then
    filePath="$(dirname ${0})"
    if [ ! "${isdotfiles}" ]; then
        if type git > /dev/null 2>&1; then
            git clone https://github.com/honos645/dotfiles
        elif type curl > /dev/null 2>&1; then
            command curl -C - -OL https://github.com/honos645/dotfiles/archive/refs/heads/main.tar.gz
            command tar xvf main.tar.gz
            command mv dotfiles-main dotfiles
            command rm -rf main.tar.gz
        else
            echo "Download failured Require git or curl or wget"
            exit 1
        fi
        filePath="$(pwd)/dotfiles"
    fi
    command mkdir -p ${HOME}/.local/bin
    command ln -s ${filePath}/bin/dtofiles-ctl ${HOME}/.local/bin/dotfiles-ctl
    command echo "${filePath}/bin/dtofiles-ctl"
    command echo "${HOME}/.local/bin/dotfiles-ctl"
else
    command echo -e "honos645's dotfiles already installed!"
fi

# [[ -n "${_COMMON}" ]] || source lib/common.sh

# CONFIGS=$(find . -type f -name "*.conf.sh")

# for config in ${CONFIGS}; do
#     command source ${config}
#     $(basename ${config} .conf.sh)-install
# done
