#!/bin/bash

[[ -n "${_COMMON}" ]] && return || readonly _COMMON=1

for target in $(find ${HOME}/.dotfiles/lib -name "*.sh" -not -name "dot.*"); do
    source ${target}
done
