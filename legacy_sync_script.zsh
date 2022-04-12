#!/usr/bin/env zsh
# This script is used in `shell/zsh/utils.zsh` update_my_repos. Whenver you have something you want to sync
# across machines, put the scritps here.

rm -rf "$XDG_DATA_HOME/pyenv" $XDG_CACHE_HOME/${SHELL##*/}/pyenv
