#!/usr/bin/env bash

# dotty bootstrapper
#
# Installs zsh & git, then clones this repo to DOTTY_HOME. This script is
# intended to be run remotely, via curl:
#
# bash <(curl -s https://raw.githubusercontent.com/ztlevi/dotty/master/bootstrap.sh)

export DOTTY_HOME=~/.config/dotty

_msg() { printf "\r\033[2K\033[0;32m[ .. ] %s\033[0m\n" "$*"; }
function _is_callable() {
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null || return 1
  done
}
_uncallable() { ! command -v "$1" >/dev/null; }
function _os() {
  case $OSTYPE in
    linux*) if [[ -f /etc/arch-release ]]; then
      echo linux-arch
    elif [[ -f /etc/debian_version ]]; then
      echo linux-debian
    elif [[ -f /etc/yum.conf ]]; then
      echo linux-RHEL
    fi ;;
    darwin*) echo macos ;;
    cygwin*) echo cygwin ;;
  esac
}

_msg "Installing homebrew, zsh, gh..."
case $(_os) in
  macos)
    # Install Xcode command line tools
    xcode-select --install
    if ! _is_callable brew; then
      bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    ;;
  linux-*)
    if ! _is_callable brew; then
      bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    # Leave bash as plain terminal environment
    touch $HOME/.bashrc
    cat <<EOF >> $HOME/.bashrc
# eval \$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
export PATH=/usr/local/bin/usr/local/sbin:/usr/bin:/usr/sbin:$HOME/.local/bin:$HOME/bin:/bin
EOF
    ;;
esac

brew install zsh gh git pre-commit

if [[ ! -d "$DOTTY_HOME" ]]; then
  _msg "Cloning dotty repository..."
  git clone https://github.com/ztlevi/dotty.git $DOTTY_HOME

  cd $DOTTY_HOME
  git submodule update --init config
  pre-commit install
fi

_msg
_msg "And done!"
_msg
_msg "Use $DOTTY_HOME/deploy to install your dotfiles, I suggest you begin"
_msg "with 'shell/zsh' and, then'base/arch' or 'base/macos'."
