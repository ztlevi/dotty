#!/usr/bin/env zsh
# Some references:
# https://zdharma.github.io/zinit/wiki/INTRODUCTION/
# https://github.com/seagle0128/dotfiles/blob/master/.zshrc
source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
      zinit-zsh/z-a-rust \
      zinit-zsh/z-a-readurl \
      zinit-zsh/z-a-patch-dl \
      zinit-zsh/z-a-bin-gem-node

# Oh My Zsh
zinit for \
      OMZL::bzr.zsh \
      OMZL::cli.zsh \
      OMZL::clipboard.zsh \
      OMZL::compfix.zsh \
      OMZL::completion.zsh \
      OMZL::correction.zsh \
      OMZL::diagnostics.zsh \
      OMZL::directories.zsh \
      OMZL::functions.zsh \
      OMZL::git.zsh \
      OMZL::grep.zsh \
      OMZL::history.zsh \
      OMZL::key-bindings.zsh \
      OMZL::misc.zsh \
      OMZL::nvm.zsh \
      OMZL::prompt_info_functions.zsh \
      OMZL::spectrum.zsh \
      OMZL::termsupport.zsh \
      OMZL::theme-and-appearance.zsh \
      OMZP::common-aliases

# GIT
zinit wait lucid for \
  OMZP::git \
  OMZP::gitignore \
# OMZP::gh
# OMZP::git-extras
# wfxr/forgit
# TODO: https://github.com/zdharma/zinit/issues/477
# zinit ice pick"git-prompt.sh" cp"git-prompt.sh -> git-prompt.sh"
# zinit snippet OMZP::gitfast

# DOCKER
zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker

zinit wait lucid for \
  OMZP::docker-compose \
# OMZP:docker-machine

# RUBY
# zinit wait lucid for \
# OMZP::ruby
# OMZP::rbenv
# OMZP::gem

# PYTHON
zinit wait lucid for \
  OMZP::python \
  OMZP::pip
# OMZP::django

# GO
zinit wait lucid for \
  OMZP::golang

# NODE
zinit wait lucid for \
  OMZP::node \
  OMZP::npm \
  OMZP::yarn
# OMZP::react-native

# ZSH
zinit wait lucid for OMZP::zsh_reload
zinit wait lucid light-mode for \
  hlissner/zsh-autopair \
  zsh-users/zsh-completions \
  zsh-users/zsh-history-substring-search \
  zdharma/fast-syntax-highlighting

# Vi-mode
zinit wait lucid light-mode for \
  jeffreytse/zsh-vi-mode

# TMUX
zinit wait lucid for \
  OMZP::tmux
# OMZP::tmuxinator
zinit ice as"completion"
zinit snippet OMZ::plugins/tmux-cssh/_tmux-cssh

# CLOUD
zinit wait lucid for \
  OMZP::aws

# MISC
zinit ice as"completion"
zinit snippet OMZ::plugins/ripgrep/_ripgrep
zinit ice as"completion"
zinit snippet OMZ::plugins/fd/_fd

zinit wait lucid for \
  OMZP::fzf \
  OMZP::history \
  OMZP::web-search \
  OMZP::nmap \
  OMZP::copydir \
  OMZP::copyfile \
  OMZP::common-aliases \
  OMZP::command-not-found \
  OMZP::rsync \
  OMZP::dotenv \
  OMZP::extract \
  OMZP::jira \
# OMZP::heroku
# OMZP::mosh
# OMZP::colored-man-pages
zinit wait lucid light-mode for \
  soimort/you-get

# THEME
zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit load starship/starship
# zinit ice depth"1" # git clone depth
# zinit light caiogondim/bullet-train-oh-my-zsh-theme
# zinit snippet jispwoso
# zinit snippet OMZT::bureau
# zinit light denysdovhan/spaceship-prompt

# Calling compinit Without Turbo Mode: https://github.com/zdharma/zinit#completions-2
autoload -Uz compinit
compinit

# -q is for quiet; actually run all the `compdef's saved before
#`compinit` call (`compinit' declares the `compdef' function, so
# it cannot be used until `compinit' is ran; Zinit solves this
# via intercepting the `compdef'-calls and storing them for later
# use with `zinit cdreplay')
zinit cdreplay -q

source $DOTFILES/shell/zsh/post-zsh-plugins.zsh
