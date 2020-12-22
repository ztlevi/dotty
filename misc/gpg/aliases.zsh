export GPG_TTY="$(tty)"
_run gpg-connect-agent updatestartuptty /bye >/dev/null
