#!/usr/bin/env zsh
# This script is used in `shell/zsh/utils.zsh` update_my_repos. Whenver you have something you want to sync
# across machines, put the scritps here.

brew uninstall -f openssh

brew uninstall -f adoptopenjdk/openjdk/adoptopenjdk8 adoptopenjdk/openjdk/adoptopenjdk11
brew untap -f adoptopenjdk/openjdk
