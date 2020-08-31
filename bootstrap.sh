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
function _os() {
  case $OSTYPE in
  linux*) if [[ -f /etc/arch-release ]]; then
    echo arch
  elif [[ -f /etc/debian_version ]]; then
    echo debian
  fi ;;
  darwin*) echo macos ;;
  cygwin*) echo cygwin ;;
  esac
}

if _uncallable zsh || _uncallable git || _uncallable git-lfs; then
  # NOTE Macos has both already
  _msg "Installing git, zsh and git-lfs"
  case $(_os) in
  macos)
    if ! _is_callable brew; then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install git zsh git-lfs
    ;;
  debian)
    if ! _is_callable brew; then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    fi
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    brew install git zsh git-lfs
    ;;
  arch)
    sudo pacman --needed --noconfirm -S git zsh git-lfs
    ;;
  esac
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
