#!/usr/bin/env zsh
# This script is used in `shell/zsh/utils.zsh` update_my_repos. Whenver you have something you want to sync
# across machines, put the scritps here.

if [[ -d ~/.dotty ]]; then
  mv ~/.dotty ~/.config/dotty
  cd ~/.config/dotty
  ./deploy -l shell/zsh
  src
  update_topics
fi

if [[ ! -d ~/.config/dotty/config ]]; then
  git submodule update --init config
fi

brew uninstall -f ctags direnv
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
