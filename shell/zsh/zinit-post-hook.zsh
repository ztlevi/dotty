# Add Compdef
zinit snippet ${0:A:h}/compdef.zsh

# Calling compinit Without Turbo Mode: https://github.com/zdharma/zinit#completions-2
autoload -Uz compinit
compinit

# -q is for quiet; actually run all the `compdef's saved before
#`compinit` call (`compinit' declares the `compdef' function, so
# it cannot be used until `compinit' is ran; Zinit solves this
# via intercepting the `compdef'-calls and storing them for later
# use with `zinit cdreplay')
zinit cdreplay -q
