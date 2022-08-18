[[ $(fgconsole 2>/dev/null) == 1  ]] && exec startx

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]dom\[$(tput setaf 4)\]@\[$(tput setaf 5)\]ubuntu \[$(tput setaf 2)\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]"

