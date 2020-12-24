# Fallback to pinentry-curses if in ssh terminal
if [[ -n "$SSH_CONNECTION" ]]; then
  export GPG_TTY="$(tty)"
  export PINENTRY_USER_DATA="USER_CURSES=1"
fi

if [[ -n "$SSH_CONNECTION" ]]; then
  git config --global --unset user.signingkey
  git config --global --unset commit.gpgsign
  git config --global --unset tag.gpgsign
else
  git config --global --set user.signingkey ztlevi.work@gmail.com
  git config --global --set commit.gpgsign true
  git config --global --set tag.gpgsign true
fi
