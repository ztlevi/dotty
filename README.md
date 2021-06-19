# dotty - Scalable dotfiles

Dotty with your dotfiles? Try dotty, a scalable dotfiles manager for linux and macos.

This repo is forked from [Hlissner's dotfiles](https://github.com/hlissner/dotfiles).

Dotfiles for Ubuntu, Arch and MacOS!

> Note: Arch support is deprecated in favor of another Linux distribution NixOS. But the updates
> should be trivial and you should be able to figure out.

![](./screenshots/terminal.jpg)

## Quick start

`bash <(curl -s https://raw.githubusercontent.com/ztlevi/dotty/master/bootstrap.sh)`

Do a global replace in this repo. Replace my name `Ting Zhou` and my email `ztlevi.work@gmail.com`.

## Install

```sh
cd ~/.dotty

# Git

# Minimal os setup (required)
# MacOS
./deploy base/macos
# Arch
./deploy base/arch
# Debian or RHEL
./deploy base/linux

# Shell basics (required)
./deploy shell/zsh shell/git

# Linux Desktop Environment (Gnome/Awesome/Bspwm)
./deploy desktop/bspwm

# Shell
./deploy shell/alacritty shell/tmux shell/ranger \
  shell/fzf shell/aspell shell/work
# Editor
./deploy editor/emacs editor/neovim editor/editorconfig
# Development
./deploy dev/cc dev/go dev/latex dev/node dev/python dev/java
# Misc
./deploy misc/docker misc/gpg misc/apps

# Optional private apps. Do not install on company machines.
./deploy misc/private
```

## Post-Installation

1. Don't forget to import your private/public GPG keys, see [README](./misc/gpg/README.md).
2. On Linux, you will need to init `pass` to enable Git-Credential-Manager-Core (GCM-Core),
   `pass init ztlevi.work@gmail.com`. If you select **personal access token**, go
   [here](https://github.com/settings/tokens) to create a new token.

## Overview

```sh
# general
bin/       # global scripts
fonts/     # user fonts
assets/    # wallpapers, sounds, screenshots, etc
desktop/   # linux desktop environments

# categories
base/      # provisions my system with the bare essentials
dev/       # relevant to software development & programming in general
editor/    # configuration for my text editors
misc/      # for various apps & tools
shell/     # shell utilities, including zsh + bash
```

## Dotfile management

```sh
Usage: deploy [-acdlLit] [TOPIC...]

  -a   Target all enabled topics (ignores TOPIC args)
  -c   Afterwards, remove dead symlinks & empty dot-directories in $HOME.
       Can be used alone.
  -d   Unlink and run `./_init clean` for topic(s)
  -l   Only relink topic(s) (implies -i)
  -L   List enabled topics
  -i   Inhibit install/update/clean init scripts
  -t   Do a test run; do not actually do anything
```

e.g.

- `deploy base/arch shell/{zsh,tmux}`: enables base/arch, shell/zsh & shell/tmux
- `deploy -d shell/zsh`: disables shell/zsh & cleans up after it
- `deploy -l shell/zsh`: refresh links for shell/zsh (inhibits init script)
- `deploy -l`: relink all enabled topics
- `deploy -L`: list all enabled topics

Here's a breakdown of what the script does:

```sh
cd $topic
if [[ -L $DOTFILES_DATA/${topic//\//.}.topic ]]; then
    ./_init update
else
    ln -sfv $DOTFILES/$topic $DOTFILES_DATA/${topic//\//.}.topic

    ./_init install
    ./_init link
fi
```

## FAQ

- Why I cannot do git commit?
  - Make sure you create your GPG key or delete `user.signingkey` property in
    `$HOME/.config/git/config`.
- I installed npm packages globally but it not showed up in `$HOME/.local/share/nodenv/shims` path.
  - Make sure you run `nodenv rehash` to generate bin files.
- I want to use dark theme, what changes should I make?
  - Change LS_COLORS in `~/.dotty/shell/alacritty/vivid.zsh`.
  - Change the theme_file [here](https://github.com/ztlevi/dotty/blob/master/shell/alacritty/_init#L53).
  - Delete the maglev plugin under `~/.local/share/tmux/plugins`. Change tmux plugin [here](https://github.com/ztlevi/dotty/blob/master/shell/tmux/tmux.conf#L44) to `ztlevi/maglev-dark`.

## Relevant projects

- [DOOM Emacs](https://github.com/ztlevi/doom-config) (pulled by `editor/emacs`)
- My vim config (pulled by `editor/neovim`)
