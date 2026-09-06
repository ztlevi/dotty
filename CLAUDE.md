# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

`dotty` is a topic-based dotfiles manager (zsh/bash), forked from hlissner's dotfiles. It has no
build step, test suite, or compiled artifacts — it's shell scripts that install packages and
symlink config files into place. Two repos combine to form a working setup:

- **This repo (`dotty`)** — the manager itself: `deploy` script, `bootstrap.sh`, and the topic
  directory tree (`base/`, `shell/`, `dev/`, `editor/`, `misc/`, `wm/`). Each topic dir here only
  holds an `_init` script (install/link/clean logic); it does not contain the actual dotfiles.
- **`config/` submodule** — a *separate* git repo (`ztlevi/dotty-config`), checked out as a git
  submodule at `config/`. This is where the actual dotfile contents live (`config/shell/zsh/.zshrc`,
  `config/shell/git/...`, etc.), mirroring the same topic structure as the parent repo. When editing
  actual dotfile *content* (as opposed to install logic), you are almost always editing inside
  `config/`, which must be committed/pushed as its own repo, separately from the parent repo's
  submodule pointer bump.
- `assets/` — a separate submodule/clone (private, gitignored) for wallpapers/fonts.

## The topic system

Every leaf directory like `shell/zsh/`, `dev/node/`, `misc/docker/` is a **topic**. A topic is
"deployed" by running `./deploy <topic>` (or the `dotty` shell function once `shell/zsh` is
deployed and sourced — aliased as `D`).

Each topic has an `_init` script (zsh, executable) that sources `deploy` and defines up to four
functions, then calls `init "$@"` at the bottom:

- `install()` — installs packages (mostly via `brew install ...`; branch on `$(_os)` for
  linux-arch/linux-debian/linux-AL/linux-RHEL/macos differences), runs once per topic.
- `update()` — re-run on subsequent deploys of an already-enabled topic instead of `install()`.
- `link()` — symlinks files from `$DOTTY_CONFIG_HOME/<topic>/...` (i.e. `config/<topic>/...`) into
  `$HOME` or `$XDG_CONFIG_HOME` via the `mklink` helper. Runs after install/update.
- `clean()` — undo/remove state; runs when a topic is disabled (`dotty -d <topic>`).

`deploy` tracks "enabled" topics as symlinks under `$DOTTY_DATA_HOME` (`~/.local/share/dotty`),
named `<topic-with-dots-instead-of-slashes>.topic`. Whether a topic is enabled decides
install-vs-update; `-l` forces relink-only (skips install scripts entirely).

`config/env` (sourced by `deploy` and by every `_init`) defines all of this: `DOTTY_HOME`,
`DOTTY_CONFIG_HOME` (`=$DOTTY_HOME/config`, i.e. the submodule), `DOTTY_DATA_HOME`, the
`echo-info/echo-ok/echo-fail` logging helpers, `_os()` (OS/distro detection), `_is_callable`,
`mklink`, and the `topic-*` helpers. Read this file before touching any `_init` script — nearly
every topic script depends on functions defined here.

## Common commands

```sh
# Deploy (install + link) one or more topics
./deploy shell/zsh shell/git dev/node
dotty shell/zsh          # once shell/zsh is deployed and `dotty`/`D` is on PATH

# Dry run — see what would happen without doing it
./deploy -t shell/zsh

# Relink only (skip install/update scripts), e.g. after editing config/ dotfile content
dotty -l shell/zsh

# Reinstall a topic from scratch
dotty -r shell/zsh

# Disable and clean up a topic
dotty -d shell/zsh

# List all currently enabled topics
dotty -L

# Print a topic's README/usage (looks in both <topic>/README.md and config/<topic>/README.md)
dotty -H shell/tmux

# Remove dead symlinks / empty dirs left in $HOME
dotty -c
```

There are no unit tests. `pre-commit` runs `prettier` (config in `.prettierrc`, printWidth 100,
markdown proseWrap always) and `git-secrets` — run `pre-commit run --all-files` before committing
if you've touched formatted files, to catch what CI-equivalent checks would flag.

## Working across the submodule boundary

- Adding/editing an `_init` script (install logic, package lists, symlink targets) → commit in the
  **parent** `dotty` repo.
- Editing actual dotfile content (a `.zshrc`, a `tmux.conf`, an alias file, etc.) → you're inside
  `config/`, a separate git repo/working tree. Commit and push there first, then (if desired) bump
  the submodule pointer in the parent repo with a separate commit.
- `git status` in the parent repo shows the submodule as modified whenever `config/` has a dirty
  working tree OR its checked-out commit differs from the pinned submodule SHA — check `git -C
  config status` to tell which.

## Conventions

- Scripts are zsh (`#!/usr/bin/env zsh`), using zsh-specific syntax (`${0:A:h}`, glob qualifiers
  like `(N/^F)`, associative/array expansions) — not portable to bash except `bootstrap.sh` and
  `deploy`'s bash-compatible bits.
- Package installation goes through Homebrew (`brew`) uniformly across macOS and Linux
  (Linuxbrew), even on Arch/Debian/Amazon Linux — avoid reaching for `apt`/`pacman`/`yum` directly
  in `_init` scripts unless following an existing pattern (see `base/linux/_init`, `base/arch/_init`
  for the exceptions, e.g. base system provisioning before brew exists).
  Some topics use `APT_INSTALL` (alias in `config/env`) for the rare case where an apt-only package
  is needed.
- OS/distro branching always goes through `case $(_os) in macos) ...;; linux-*) ...;; esac`, never
  ad hoc `$OSTYPE` checks.
