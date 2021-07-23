#!/usr/bin/env zsh

if [[ -d $DOTTY_ASSETS_HOME/gpgexport ]]; then
  cd $DOTTY_ASSETS_HOME/gpgexport
  gpg -a --export >mypubkeys.asc
  gpg -a --export-secret-keys >myprivatekeys.asc
  gpg --export-ownertrust >otrust.txt
fi
