#!/bin/bash

[[ -n "${_COMMON}" ]] || source ./lib/common.sh

cd ${TOP_DIR}

TARGETS=$(find . -type f -name "*.conf.sh")

for target in ${TARGETS}; do
    command source ${target}
    $(basename ${target} .conf.sh)-uninstall
done

command rm -rf $(readlink -f ${HOME}/.dotfiles)
command rm -rf ${HOME}/.dotfiles ${HOME}/.dotfiles.backup

command echo "uninstalled dotfiles"
