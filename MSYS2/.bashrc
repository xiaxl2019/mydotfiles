# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# User specific aliases and functions
if [[ $TERM =~ xterm* ]]
then
    PS1=""
    PS1+="\[$(tput bold)$(tput setaf 1)\]["
    PS1+="\[$(tput setaf 2)\]\u"
    PS1+="\[$(tput setaf 3)\]@"
    PS1+="\[$(tput setaf 4)\]\h "
    PS1+="\[$(tput setaf 5)\]\w"
    PS1+="\[$(tput setaf 1)\]]"
    PS1+="\[$(tput sgr0)\] "
fi

if [ -f /mingw64/share/fzf/key-bindings.bash ]
then
    source /mingw64/share/fzf/key-bindings.bash
fi

HISTSIZE=10000                 # increase history size (default is 500)
HISTFILESIZE=$(($HISTSIZE*2))  # increase history file size (default is 500)
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoreboth:erasedups

function mycd() {
    if [[ $# == 0 ]]; then
        cd ~
        return
    fi

    cd "$1" && return

    read -p "enter [y] to mkdir it: " prompt
    if [[ $prompt == "y" ]]; then
        mkdir "$1" && cd "$1"
    fi
}

alias cd='mycd'

alias ls='ls -v --color=auto --time-style=long-iso'
alias ll='ls -l'
alias l.='ls -d .*'
alias la='ls -A'

alias cp='cp -p'
alias tree='tree -v'

alias man='man -L en'
alias tldr='tldr -L en'

alias dul='du * -sch | sort -h'
alias duf='duf -only local'

export PATH=$PATH:"/c/Users/$USER/AppData/Local/Programs/Microsoft VS Code/bin"
