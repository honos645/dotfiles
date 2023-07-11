#!/bin/bash

readonly _CHECK=0

if [ ! -e "${HOME}/.local/bin/dotfiles-ctl" ]; then
    if type git > /dev/null 2>&1; then
        git clone https://github.com/honos645/dotfiles
    elif type curl > /dev/null 2>&1; then
        command curl  -C - -OL https://github.com/honos645/dotfiles/archive/refs/heads/main.tar.gz
        command tar xvf main.tar.gz
        command mv dotfiles-main dotfiles
        command rm -rf main.tar.gz
    else
        echo "Download failured Require git or curl or wget"
    fi
fi

command cd ./dotfiles

command ln -s ${HOME}/.local/bin/dotfiles-ctl $(pwd)/bin/dtofiles-ctl

[[ -n "${_COMMON}" ]] || source lib/common.sh

# CONFIGS=$(find . -type f -name "*.conf.sh")

# for config in ${CONFIGS}; do
#     command source ${config}
#     $(basename ${config} .conf.sh)-install
# done
