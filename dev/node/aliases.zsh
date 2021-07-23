_cache nodenv init - --no-rehash
env_rehash_cmds+=("nodenv rehash")

zinit wait lucid for \
  OMZP::node \
  OMZP::npm \
  OMZP::yarn
# OMZP::react-native

# Run locally installed bin-script, e.g. n coffee file.coffee
alias n='PATH="$(npm bin):$PATH"'

alias npmgL0="npm list -g --depth=0"

_is_callable prettier && alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}" --ignore-path $DOTTY_HOME/shell/git/ignore'

if _is_callable cspell; then
  alias cspell="cspell --config '$DOTTY_HOME/dev/node/.cspell.json'"
  alias cspell-all="cspell '**/*.{js,jsx,ts,tsx,c,cc,cpp,h,hh,hpp,go,json,py,java}'"
fi
