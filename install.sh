#!/bin/bash

source ./lib/init.sh
source ./lib/common.sh
source ./src/vim/vim.conf.sh
source ./src/git/git.conf.sh
source ./src/bash/bash.conf.sh
source ./src/emacs/emacs.conf.sh


vim-install
git-install
bash-install
emacs-install
