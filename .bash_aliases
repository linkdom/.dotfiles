# bash
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias '?'=duck
alias '??'=google
alias 'c'=clear
alias 'dotfiles'='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias 'cal'='cal -3'
alias 'v'='nvim'
alias 'update'='sudo pacman -Syyu && yay -Syyu'
alias '..'='cd ..'
alias '...'='cd ../../'
alias 'vpn'='sudo openfortivpn -c /etc/openfortivpn/config'

# laravel
alias 'pamfs'='php artisan migrate:fresh && php artisan db:seed'
alias 'pas'='php artisan serve'
alias 'nrw'='npm run watch'
alias 'larapack'='php artisan make:model -msfc $1'
alias 'console'='php artisan tinker'

# strapi
alias 'sbas'='rm -rf .cache && strapi build && npm run develop'

# npm
alias 'nrd'='npm run develop'

# git
alias 'gis'='git status'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#mkdir
alias mkdir='mkdir -p'


#functions
alias 'open'='function _open()
{
nohup brave-browser $1 &
};_open'
