#!/usr/bin/env zsh
# This script is used in `shell/zsh/utils.zsh` update_my_repos. Whenver you have something you want to sync
# across machines, put the scritps here.

brew uninstall -f diff-so-fancy
brew install -f git-delta

brew uninstall -f fzf
rm -f $HOME/.zinit/polaris/bin/fzf $HOME/.zinit/completions/_fzf_completion

D -d shell/fzf
D shell/skim
