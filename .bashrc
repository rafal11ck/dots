#
# ~/.bashrc
#

export PATH="$PATH:/home/rafal/.emacs.d/bin:/home/rafal/.local/bin/:~/.scripts/desktop:~/.scripts/wayland:~/.scripts/misc"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" #needs ssh agent service from .config/systemd/ssh-agent.service as user
export GDK_SCALE=2
export XCURSOR_SIZE=32
export EDIOTR="nvim"

[[ $- != *i* ]] && return

#fzf keybindings
[[ -x "$(command -v fzf)" ]] && source /usr/share/fzf/key-bindings.bash 

complete -cf doas
complete -cf setsid

alias zathura='setsid zathura'
alias ls='ls --color=auto'
alias rmv="rsync --remove-source-files --progress --recursive"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias configtui="gitui -w ~/ -d ~/dotfiles/"
alias vpntohome="doas tailscale up --exit-node=letmein-vm --accept-routes"
alias jellyfinmediaplayer="setsid jellyfinmediaplayer --disable-gpu > /dev/null"

#export VISUAL="emacsclient -c"

