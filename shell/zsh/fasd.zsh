export _FASD_DATA="$XDG_CACHE_HOME/fasd"
export _FASD_VIMINFO="$XDG_CACHE_HOME/viminfo"

if [[ $TERM != dumb ]] && _is_callable fasd; then
  _cache fasd --init posix-alias zsh-{hook,{c,w}comp{,-install}}
fi
