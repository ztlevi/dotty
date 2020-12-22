# if ! _is_running gpg-agent; then
#   mkdir -p $HOME/.gnupg
#   _run gpg-agent --homedir $HOME/.gnupg --use-standard-socket --daemon >/dev/null
# fi
# export GPG_TTY="$(tty)"
# _run gpg-connect-agent updatestartuptty /bye >/dev/null
