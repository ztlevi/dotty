# call `antigen update` on your terminal and it will update the oh-my-zsh repository
# Update bundles with `antigen reset`
source $DOTFILES/shell/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# GIT
antigen bundle git
antigen bundle gh
antigen bundle gitignore
# antigen bundle git-extras
# antigen bundle gitfast
# antigen bundle 'wfxr/forgit'

# DOCKER
antigen bundle docker
antigen bundle docker-compose
# antigen bundle docker-machine

# RUBY
# antigen bundle ruby
# antigen bundle rbenv
# antigen bundle gem

# PYTHON
antigen bundle python
antigen bundle pip
# antigen bundle django

# GO
antigen bundle golang

# NODE
antigen bundle node
antigen bundle npm
antigen bundle yarn
# antigen bundle react-native

# ZSH
antigen bundle zsh_reload
antigen bundle hlissner/zsh-autopair
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zdharma/fast-syntax-highlighting

# Vi-mode
antigen bundle jeffreytse/zsh-vi-mode

# TMUX
antigen bundle tmux
antigen bundle tmux-cssh
# antigen bundle tmuxinator

# CLOUD
antigen bundle aws

# MISC
antigen bundle fzf
antigen bundle history
antigen bundle ripgrep
antigen bundle web-search
antigen bundle nmap
antigen bundle copydir
antigen bundle copyfile
antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle rsync
antigen bundle dotenv
antigen bundle fd
antigen bundle extract
antigen bundle soimort/you-get
antigen bundle jira
# antigen bundle heroku
# antigen bundle mosh
# antigen bundle colored-man-pages

# THEME
if _is_callable starship; then
  eval "$(starship init zsh)"
else
  antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
  # antigen theme jispwoso
  # antigen theme bureau
  # antigen theme denysdovhan/spaceship-prompt
fi

# OS
if [[ $(_os) == 'macos' ]]; then
  antigen bundle brew
  antigen bundle osx
elif [[ $(_os) == 'linux-arch' ]]; then
  antigen bundle archlinux
elif [[ $(_os) == 'linux-debian' ]]; then
  antigen bundle ubuntu
elif [[ $(_os) == 'linux-RHEL' ]]; then
  antigen bundle yum
elif [[ $(_os) == 'cygwin' ]]; then
  antigen bundle cygwin
fi

# Tell antigen that you're done.
antigen apply

source $DOTFILES/shell/zsh/post-bundles.zsh
