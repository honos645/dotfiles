#!/bin/bash

TOP_DIR=$(cd $(dirname ${0}); pwd)
MODULE_DIR=${TOP_DIR}/modules
SOURCE_DIR=${TOP_DIR}/src

TOP_BACKUP_DIR=${HOME}/.dotfiles.backup
TODAY=$(date '+%Y-%m-%d')
BACKUP_DIR=${TOP_BACKUP_DIR}/${TODAY}

# link dotfiles directory
if [ ! -L ${HOME}/.dotfiles ]; then
  command ln -sf ${TOP_DIR}/ ${HOME}/.dotfiles
fi

# create backup directory
if [ ! -d ${HOME}/.dotfiles.backup ]; then
  command mkdir -p ${HOME}/.dotfiles.backup
fi

