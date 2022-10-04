#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias rmv="rsync --remove-source-files --progress --recursive"
export PATH="$PATH:/home/rafal/.emacs.d/bin:/home/rafal/.local/bin/:"
alias vpntohome="doas tailscale up --exit-node=letmein-vm --accept-routes"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
