ISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

export HISTTIMEFORMAT='%F %T '

shopt -s checkwinsize

shopt -s globstar &> /dev/null

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
    elif [ -f /etc/bash_completion.d/git-prompt ]; then
	. /etc/bash_completion.d/git-prompt
    fi
fi

export PATH=$HOME/.local/bin:$PATH

if [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
    . "/usr/local/etc/profile.d/bash_completion.sh"
elif [[ -r "/etc/profile.d/bash_completion.sh" ]]; then
    . "/etc/profile.d/bash_completion.sh"
fi

# git completion
if [ -f $HOME/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
# git prompt
if [ -f $HOME/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

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

#Color definitions
WHITE="\[\e[0m\]"
CREAM_YELLOW="\[\e[33m\]"
YELLOW="\[\e[0;33m\]"
DARK_GREEN="\[\e[0;32m\]"
GREEN="\[\e[1;32m\]"
CYAN="\[\e[0;36m\]"
PALE_BLUE="\[\e[1;34m\]"
RED="\[\e[0;31m\]"
PALE_RED="\[\e[1;31m\]"
MAGENTA="\[\e[0;35m\]"

export PS1="[\t] ${GREEN}\u@\h${WHITE}:${PALE_BLUE}\w${CREAM_YELLOW}\$(__git_ps1 ' (%s)')${WHITE}\n\$ "

if [ -d $HOME/.dotfiles ]; then
    . $HOME/.dotfiles/src/bash/aliases
fi

if [ -d $HOME/.dotfiles ]; then
    . $HOME/.dotfiles/src/bash/function
fi

function start_pro6_docker() {
    sudo service docker start
    cd /mnt/c/Users/sosuk/OneDrive/university/ltr_2022/prg_プログラミング演習6/
    make up && sleep 1
}
alias s_pro6=start_pro6_docker
alias d_pro6='make -C /mnt/c/Users/sosuk/OneDrive/university/ltr_2022/prg_プログラミング演習6 down'
alias intern='/mnt/c/Users/sosuk/OneDrive/university/ltr_2022/prg_プログラミング演習6/internship-client-1.1/intern 127.0.0.1 10000'
