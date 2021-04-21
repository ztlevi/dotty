_cache nodenv init - --no-rehash

# Run locally installed bin-script, e.g. n coffee file.coffee
alias n='PATH="$(npm bin):$PATH"'

alias npmgL0="npm list -g --depth=0"

_is_callable prettier && alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}" --ignore-path $DOTFILES/shell/git/ignore'
