if [ -d "~/.bin" ]; then
    source "~/.bin/*"
fi

if [ -d "${HOME}/.dotfiles" ]; then
    TARGET=$(find -L ${HOME}/.dotfiles/bin -type f)
    for target in ${TARGET}; do
	command source "${target}"
        target=$(basename ${target}) 
        command alias ${target}="${target}"
    done
fi

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias python='python3'
alias pip='pip3'

alias vi='vim'

alias gmv='git mv '
alias grm='git rm'
alias gls='git status'
alias bat='batcat'

