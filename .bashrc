# hnishi's .bashrc
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Show date and time in history
export HISTTIMEFORMAT='%F %T '

# https://twitter.com/nixcraft/status/1258027970406408192
#export HISTIGNORE='ls *:pwd'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar &> /dev/null

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /etc/bash_completion.d/git-prompt ]; then
    . /etc/bash_completion.d/git-prompt
  fi
fi

# Set environment varibales
export PATH=$HOME/.local/bin:$PATH

# completion
if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  . "/usr/local/etc/profile.d/bash_completion.sh"
elif [[ -r "/etc/profile.d/bash_completion.sh" ]]; then
  . "/etc/profile.d/bash_completion.sh"
#else
#  echo "bash_completion.sh was not found (~/.bashrc)."
fi

# git completion
source ~/.git-completion.bash
# git prompt
source ~/.git-prompt.sh

export DOTLIBS_DIR=$HOME/.dotlibs

# Language
export LANG=ja_JP.UTF-8

# add されていない変更の存在を「＊」で示す
# commit されていない変更の存在を「＋」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# add されていない新規ファイルの存在を「％」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stash がある場合は「＄」で示す
GIT_PS1_SHOWSTASHSTATE=true
# upstream と同期している場合は「＝」で示す
# upstream より進んでいる場合は「＞」で示す
# upstream より遅れている場合は「＜」で示す
GIT_PS1_SHOWUPSTREAM=auto

# Color definitions
# WHITE="\[\e[0m\]"
# CREAM_YELLOW="\[\e[33m\]"
# YELLOW="\[\e[0;33m\]"
# DARK_GREEN="\[\e[0;32m\]"
# GREEN="\[\e[1;32m\]"
# CYAN="\[\e[0;36m\]"
# PALE_BLUE="\[\e[1;34m\]"
# RED="\[\e[0;31m\]"
# PALE_RED="\[\e[1;31m\]"
# MAGENTA="\[\e[0;35m\]"

export PS1='[\t] \[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w \[\e[33m\]$(__git_ps1 " (%s)")\[\e[0m\]\n$ '

if [ -e ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ -e ~/.bash_function ]; then
	source ~/.bash_function
fi
