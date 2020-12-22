# Fallback to pinentry-curses if in ssh terminal
if [[ -n "$SSH_CONNECTION" ]]; then
  export GPG_TTY="$(tty)"
  export PINENTRY_USER_DATA="USER_CURSES=1"
fi
