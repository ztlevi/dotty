function joshuto-cd() {
  joshuto --lastdir /tmp/joshuto-lastdir
  LASTDIR="$(cat /tmp/joshuto-lastdir)"
  [ "$LASTDIR" != "$(pwd)" ] && cd "$LASTDIR"
}

function widget-joshuto-cd() {
  BUFFER="joshuto-cd"
  zle accept-line
}
zle -N widget-joshuto-cd

# Define an init function and append to zvm_after_init_commands
function personal_joshuto_bind_keys() {
  bindkey '^o' widget-joshuto-cd
}
zvm_after_init_commands+=(personal_joshuto_bind_keys)
