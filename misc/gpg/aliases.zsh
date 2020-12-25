# Fallback to pinentry-curses if in ssh terminal
export GPG_TTY="$(tty)"
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA="USER_CURSES=1"
fi
