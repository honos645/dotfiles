#!/bin/bash

[[ -n "${_COMMON}" ]] || source ./lib/common.sh

TARGETS=$(find . -type f -name "*.conf.sh")

for target in ${TARGETS}; do
    command source ${target}
    $(basename ${target} .conf.sh)-uninstall
done

command rm -rf ${HOME}/.dotfiles

command rm -rf ${TOP_DIR}

command echo "uninstalled dotfiles"
