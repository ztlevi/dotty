#!/usr/bin/env zsh
# Some references:
# https://zdharma.github.io/zinit/wiki/INTRODUCTION/
# https://github.com/seagle0128/dotfiles/blob/master/.zshrc
source ~/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for zinit-zsh/z-a-meta-plugins
# Load a few important annexes, without Turbo (this is currently required for annexes)
zinit for annexes

# This loads plugin groups defined in zinit-zsh/z-a-meta-plugins
zinit skip'zsh-users/zsh-autosuggestions' for zsh-users+fast
zinit skip'dircolors-material jonas/tig' for console-tools

# ZSH
zinit wait lucid for OMZP::zsh_reload
zinit wait lucid light-mode for \
  hlissner/zsh-autopair \
  zsh-users/zsh-history-substring-search

# VI-MODE
zinit light jeffreytse/zsh-vi-mode

# Oh My Zsh
zinit light-mode for \
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
# zinit ice svn wait lucid; zinit snippet OMZP::gitfast

# DOCKER
zinit ice as"completion"; zinit snippet OMZ::plugins/docker/_docker

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

# TMUX
zinit wait lucid for \
  OMZP::tmux
# OMZP::tmuxinator
# zinit ice as"completion"; zinit snippet OMZ::plugins/tmux-cssh/_tmux-cssh

# CLOUD
zinit wait lucid for \
  OMZP::aws

# MISC
zinit wait lucid for \
  OMZP::fzf \
  OMZP::history \
  OMZP::web-search \
  OMZP::nmap \
  OMZP::copydir \
  OMZP::copyfile \
  OMZP::command-not-found \
  OMZP::rsync \
  OMZP::dotenv \
  OMZP::extract \
  OMZP::jira \
# OMZP::heroku
# OMZP::mosh
# OMZP::colored-man-pages
zinit wait lucid light-mode for soimort/you-get

# OS
if [[ $(_os) == 'macos' ]]; then
  zinit wait lucid for OMZP::brew
  # zinit ice svn wait lucid; zinit snippet OMZP::osx
  zinit wait lucid for \
    atclone"touch music spotify _security" atpull"%atclone" 'OMZP::osx'
elif [[ $(_os) == 'linux-arch' ]]; then
  zinit wait lucid for OMZP::archlinux
elif [[ $(_os) == 'linux-debian' ]]; then
  zinit wait lucid for OMZP::ubuntu
elif [[ $(_os) == 'linux-RHEL' ]]; then
  zinit wait lucid for OMZP::yum
elif [[ $(_os) == 'cygwin' ]]; then
  zinit wait lucid for OMZP::cygwin
fi

# You will need to `zinit update ~/.dotty/shell/zsh/vivid.zsh` if you update the snippet
zinit snippet ~/.dotty/shell/zsh/vivid.zsh

# THEME
zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit load starship/starship
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
