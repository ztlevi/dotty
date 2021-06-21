#!/usr/bin/env zsh
# Some references:
# https://zdharma.github.io/zinit/wiki/INTRODUCTION/
# https://github.com/seagle0128/dotfiles/blob/master/.zshrc

### Install zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
  mkdir -p "$HOME/.zinit" && chmod g-rwX "$HOME/.zinit"
  git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" &&
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source $HOME/.zinit/bin/zinit.zsh
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
  agkozak/zsh-z \
  zsh-users/zsh-history-substring-search

# Explain aliases
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

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

# CLOUD
zinit wait lucid for \
  OMZP::aws

# MISC
zinit wait lucid for \
  OMZP::history \
  OMZP::nmap \
  OMZP::copydir \
  OMZP::copyfile \
  OMZP::command-not-found \
  OMZP::rsync \
  OMZP::dotenv \
  OMZP::extract \
  OMZP::fancy-ctrl-z \
  OMZP::jira
# OMZP::mosh
# OMZP::colored-man-pages

# THEME
if [[ $HOST == dev-dsk* ]]; then
  zinit ice depth"1" # git clone depth
  zinit light romkatv/powerlevel10k
else
  zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
  zinit load starship/starship
fi
# zinit light caiogondim/bullet-train-oh-my-zsh-theme
# zinit snippet OMZT::jispwoso
# zinit snippet OMZT::bureau
# zinit light denysdovhan/spaceship-prompt

source $DOTFILES/shell/zsh/post-zsh-plugins.zsh
