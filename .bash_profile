[[ $(fgconsole 2>/dev/null) == 1  ]] && exec startx

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

