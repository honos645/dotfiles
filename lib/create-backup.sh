#!/bin/bash

function create_backup () {
    command ln -snf ${TOP_DIR}/ ${HOME}/.dotfiles
    command mkdir -p ${HOME}/.dotfiles.backup
}
