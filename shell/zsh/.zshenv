export LANG='en_US.UTF-8'
export LC_ALL="en_US.UTF-8"
export TERM="xterm-256color"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="nvim -c 'set ft=man' -"

source $(cd ${${(%):-%x}:A:h}/../.. && pwd -P)/env

# No github credentials
HOMEBREW_NO_GITHUB_API=1

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

export ANTIGEN_BUNDLES="$HOME/.antigen/bundles"
export ZSH="$ANTIGEN_BUNDLES/robbyrussell/oh-my-zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"

# paths
typeset -gU cdpath fpath mailpath path
path=( $XDG_BIN_HOME $DOTFILES/bin $DOTFILES_DATA/*.topic/bin(N) $path )
fpath=( $XDG_BIN_HOME $fpath )

# envvars
# export SHELL=$(command -v zsh)
export LANG=${LANG:-en_US.UTF-8}
export PAGER=less
export LESS='-R -i -w -M -z-4'
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# initialize enabled topics
_load_all env.zsh
