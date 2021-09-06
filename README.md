# dotty - Scalable dotfiles manager

Dotty with your dotfiles? Try dotty, a scalable dotfiles manager for linux and macos.

This repo is forked from [Hlissner's dotfiles](https://github.com/hlissner/dotfiles).

Dotty is tested on Ubuntu, Arch and MacOS!

> Note: Arch support is deprecated in favor of another Linux distribution NixOS. But the updates
> should be trivial and you should be able to figure out.

![](./screenshots/terminal.jpg)

## Quick start

> Note: if you're in China. Use the homebrew mirror
> https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

```sh
bash <(curl -s https://raw.githubusercontent.com/ztlevi/dotty/main/bootstrap.sh)
```

This script will install homebrew, zsh and clone this dotty repo.

Do a global replace in this repo. Replace my name `Ting Zhou` and my email `ztlevi.work@gmail.com`.

## Install

```sh
cd ~/.config/dotty

# gh credentials are used by git
gh auth login

# (SKIP this) Initialize my personal assets submodule. Only me has the private repo access
# Cannont clone private submodules with password. Maybe it's due to two-factor auth is enabled.
# Authenticate with gh solves this issue.
# git submodule update --init assets

# Minimal setup (required), and start a new shell, afterwards, you can use `dotty` instead `./deploy`
./deploy base/macos # MacOS
./deploy base/linux # Debian, Arch or RHEL
./deploy shell/zsh shell/git && zsh
# Setup local git confing following this README https://github.com/ztlevi/dotty/blob/main/shell/git/README.md

# Linux Desktop Environment (Gnome/Awesome/Bspwm)
dotty wm/bspwm

# Shell
dotty shell/alacritty shell/tmux shell/ranger \
  shell/fzf shell/aspell shell/work
# Editor
dotty editor/emacs editor/neovim editor/editorconfig
# Development
dotty dev/cc dev/go dev/latex dev/node dev/python dev/java
# Misc
dotty misc/docker misc/gpg misc/cspell misc/apps

# Optional private apps. Do not install on company machines.
dotty misc/private
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
wm/        # linux window manager environments
desktop/   # linux desktop apps

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
if [[ -L $DOTTY_DATA_HOME/${topic//\//.}.topic ]]; then
    ./_init update
else
    ln -sfv $DOTTY_CONFIG_HOME/$topic $DOTTY_DATA_HOME/${topic//\//.}.topic

    source $DOTTY_CONFIG_HOME/$topic/env.zsh
    ./_init install
    ./_init link
fi
```

## FAQ

- Why I cannot do git commit?
  - Make sure you create your GPG key or delete `user.signingkey` property in
    `$HOME/.config/git/config`.
- What if I have some local zsh configuration?
  - You can `dotty shell/work`, and put things under `$HOME/work/dots/env.zsh` or
    `$HOME/work/dots/aliases.zsh`
- I installed npm packages globally but it not showed up in `$HOME/.local/share/nodenv/shims` path.
  It could also happens for pyenv and others.
  - The simplest way is run `envrehash` in shell. Under the sceens, it's running commands like
    `nodenv rehash` to generate bin files.
- I want to use dark theme, what changes should I make?
  - Change LS_COLORS in `~/.config/dotty/config/shell/alacritty/vivid.zsh`.
  - Change the theme_file
    [here](https://github.com/ztlevi/dotty/blob/master/shell/alacritty/_init#L53).
  - Change tmux theme option
    [here](https://github.com/ztlevi/dotty/blob/master/shell/tmux/tmux.conf#L40) to `dark`.
- How do I sync between different machines?
  - Unfortunately, there is no such easy way. For me, I put down install/uninstall scripts in
    `dotty/legacy_sync_script.zsh` and every time I run
    [update_my_repos](https://github.com/ztlevi/dotty/blob/master/shell/zsh/utils.zsh#L132) aliased
    as `uu`, it will run the `legacy_sync_script.zsh`. NixOS has such ability to resolve what have
    changed in your configuration and able to install and uninstall software and make sure they are
    consistent across machines. If you're interested, you can try my
    [dotty-nix](https://github.com/ztlevi/dotty-nix).

## Relevant projects

- [DOOM Emacs](https://github.com/ztlevi/doom-config) (pulled by `editor/emacs`)
- My vim config (pulled by `editor/neovim`)
