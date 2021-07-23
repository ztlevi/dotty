#!/usr/bin/env zsh

# Load my gpg keys if exists. Note: $DOTTY_ASSETS_HOME is my private repo.
if [[ -d $DOTTY_ASSETS_HOME/gpgexport ]]; then
  cd $DOTTY_ASSETS_HOME/gpgexport
  gpg --import myprivatekeys.asc
  gpg --import mypubkeys.asc
  gpg -K
  gpg -k
  gpg --import-ownertrust otrust.txt
  # restart agent
  gpgconf --kill gpg-agent
fi
