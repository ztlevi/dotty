function ranger-cd() {
  tmpfile='/tmp/choosedir'
  tempres='/tmp/ranger_temp_res'
  rm -f "$tempres"
  curdir=$(pwd)
  ranger --choosedir="$tmpfile" "${@:-$curdir}"
  if [[ -f "$tmpfile" ]] && [[ $(cat "$tmpfile") != $curdir ]]; then
    cd $(cat $tmpfile)
  fi
  if [[ -f "$tempres" ]]; then cat $tempres; fi
  rm -f "$tmpfile"
}

function widget-ranger-cd() {
  BUFFER="ranger-cd"
  zle accept-line
}
zle -N widget-ranger-cd

# Ranger
bindkey '^o' widget-ranger-cd
