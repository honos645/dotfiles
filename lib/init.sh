#!/bin/bash

TOP_DIR=$(cd $(dirname ${0}); pwd)

TOP_BACKUP_DIR=${HOME}/.dotfiles.backup

# link dotfiles directory
if [ ! -L ${HOME}/.dotfiles ]; then
  command ln -sf ${TOP_DIR}/ ${HOME}/.dotfiles
fi

# create backup directory
if [ ! -d ${HOME}/.dotfiles.backup ]; then
  command mkdir -p ${HOME}/.dotfiles.backup
fi

