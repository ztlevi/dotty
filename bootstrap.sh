#!/usr/bin/env bash

# dotfiles bootstrapper
#
# Installs zsh & git, then clones this repo to ~/Dotfiles. This script is
# intended to be run remotely, via curl:
#
# bash <(curl -s https://raw.githubusercontent.com/ztlevi/Dotfiles/master/bootstrap.sh)

export DOTFILES=~/Dotfiles
set -e

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }
_uncallable() { ! command -v "$1" >/dev/null; }

if _uncallable zsh || _uncallable git || _uncallable git-lfs; then
  # NOTE Macos has both already
  _msg "Installing git, zsh and git-lfs"
  if [[ -f /etc/arch-release ]]; then
    sudo pacman --needed --noconfirm -S git zsh
  elif [[ -f /etc/debian_version ]]; then
    sudo apt-get update && sudo apt-get install -y git zsh
  fi
fi

if [[ ! -d "$DOTFILES" ]]; then
  _msg "Deploying dotfiles repository..."
  dfrepo=https://github.com/ztlevi/Dotfiles.git
  git clone --recursive "$dfrepo" "$DOTFILES"
  (
    cd $DOTFILES/assets
    git lfs install && git lfs pull
  )
fi

#
_msg
_msg "And done!"
_msg
_msg "Use $DOTFILES/deploy to install your dotfiles, I suggest you begin"
_msg "with 'base/arch' or 'base/macos'."
