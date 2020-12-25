# Fallback to pinentry-curses if in ssh terminal
export GPG_TTY="$(tty)"
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA="USER_CURSES=1"
fi

if [[ -n "$SSH_CONNECTION" ]]; then
  git config --global --unset user.signingkey
  git config --global --unset commit.gpgsign
  git config --global --unset tag.gpgsign
else
  git config --global --add user.signingkey ztlevi.work@gmail.com
  git config --global --add commit.gpgsign true
  git config --global --add tag.gpgsign true
fi
