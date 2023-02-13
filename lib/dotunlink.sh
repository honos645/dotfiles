#!/bin/bash

function dotunlink () {
    local TARGETS=$(find  $(readlink -f ${HOME}/.dotfiles/src/$1/) -maxdepth 1 -name "dot.*")

    for TARGET in ${TARGETS}; do
        local TARGET_PATH=${TARGET//dot./.}

        [[ -L "${HOME}/$(basename ${TARGET_PATH})" ]] && unlink ${HOME}/$(basename ${TARGET_PATH})

        restore ${HOME}/$(basename ${TARGET_PATH})
    done

}
