alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias '?'=duck
alias '??'=google
alias 'c'=clear
alias 'dotfiles'='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias 'cal'='cal -3'
alias 'pams'='php artisan migrate:fresh && php artisan db:seed'

#functions
alias 'open'='function _open()
{
nohup brave-browser $1 &
};_open'
