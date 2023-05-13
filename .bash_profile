SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

if [ "$TTY" = "/dev/tty1" ]; then
	printf "\033[1;32mBooting into hyprland!\033[0m\n"
	$HOME/startw -- -keeptty > $XDG_RUNTIME_DIR/startw.log
fi

. ~/.bashrc
