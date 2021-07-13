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
zinit skip'dircolors-material jonas/tig' for console-tools
# zsh-users+fast does not load zdharma/fast-syntax-highlighting more lazy enough
zinit wait lucid for \
  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma/fast-syntax-highlighting \
  blockf \
  zsh-users/zsh-completions

# ZSH
zinit wait lucid for OMZP::zsh_reload
zinit wait lucid light-mode for \
  hlissner/zsh-autopair \
  agkozak/zsh-z

# Explain aliases
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

# VI-MODE
zinit light jeffreytse/zsh-vi-mode
export ZVM_CURSOR_STYLE_ENABLED=false
# Always starting with insert mode for each command line
export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

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
  OMZP::terraform \
  OMZP::aws
export SHOW_AWS_PROMPT=false

# MISC
zinit wait lucid for \
  OMZP::history \
  OMZP::nmap \
  OMZP::copydir \
  OMZP::copyfile \
  OMZP::command-not-found \
  OMZP::rsync \
  OMZP::extract \
  OMZP::fancy-ctrl-z \
  OMZP::jira
# OMZP::mosh
# OMZP::colored-man-pages

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
  atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
  pick"direnv" src="zhook.zsh" wait lucid for \
  direnv/direnv

# THEME
zinit ice from"gh-r" as"program" atload'!eval $(starship init zsh)' pick'**/starship'
zinit load starship/starship
export SPACESHIP_TIME_SHOW=true

# zinit light caiogondim/bullet-train-oh-my-zsh-theme
# export BULLETTRAIN_CUSTOM_FG=white
# export BULLETTRAIN_CONTEXT_FG=white

# zinit ice depth"1" # git clone depth
# zinit light romkatv/powerlevel10k
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zinit snippet OMZT::jispwoso
# zinit snippet OMZT::bureau
# zinit light denysdovhan/spaceship-prompt
