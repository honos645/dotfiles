#!/bin/bash

if [ ! -e  "${HOME}/.dotfiles" ]; then
    if type git > /dev/null 2>&1; then
        git clone https://github.com/honos645/dotfiles
    elif type curl > /dev/null 2>&1; then
        command curl -OL https://github.com/honos645/dotfiles/archive/refs/heads/main.tar.gz
        command tar xvf main.tar.gz
        command mv dotfiles-main dotfiles
        command rm -rf main.tar.gz
    elif type wget > /dev/null 2>&1; then
        command wget -O main.tar.gz https://github.com/honos645/dotfiles/archive/refs/heads/main.tar.gz
        command tar xvf main.tar.gz
        command mv dotfiles-main dotfiles
        command rm -rf main.tar.gz
    else
        echo "ERROR download failure"
    fi
fi

command cd ./dotfiles

[[ -n "${_COMMON}" ]] || source lib/common.sh

CONFIG=$(find . -type f -name "*.conf.sh")

for config in ${CONFIG}; do
    command source ${config}
    $(basename ${config} .conf.sh)-install
done

