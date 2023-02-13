#!/bin/bash

function dotlink () {
    has $1 || return

    local TARGETS=$(find  $(readlink -f ${HOME}/.dotfiles/src/$1/) -maxdepth 1 -name "dot.*")

    for TARGET in ${TARGETS}; do
        local TARGET_PATH=${TARGET//dot./.}

        backup ${HOME}/$(basename ${TARGET_PATH})

        command ln -snf ${TARGET} ${HOME}/$(basename ${TARGET_PATH})
    done
}
