#!/usr/bin/env bash

#========================================================================
#  FILE:  macos_set_default_apps.sh
#  DESCRIPTION:  Changes default apps for extensions
#  AUTHOR:  ztlevi, ztlevi1993@gmail.com
#  VERSION:  0.1
#  SOURCE: https://www.chainsawonatireswing.com/2012/09/19/changing-default-applications-on-a-mac-using-the-command-line-then-a-shell-script/
#========================================================================

# 1. Find out the current default for an extension
# ➜ duti -x md
# Typora
# /Applications/Typora.app
# abnerworks.Typora
#
# 2. Find out the bundle ID for an app
# /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Typora.app/Contents/Info.plist
#
# 3. Change the default app
# duti -s abnerworks.Typora .md all

{
  cat <<eof
com.colliderli.iina:mp4
com.colliderli.iina:mpeg
com.colliderli.iina:mov
com.colliderli.iina:mkv
com.colliderli.iina:rmvb
com.colliderli.iina:wmv
com.colliderli.iina:webm
com.colliderli.iina:flv
com.colliderli.iina:avi
eof
} | grep . |
  while IFS=$':' read bundle_id extension; do
    # Grep to see if Bundle ID exists, sending stdout to /dev/null
    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep $bundle_id >/dev/null
    # Save exit status (0=success & 1=failure)
    status=$?
    # If exit status failed, notify me & exit; if not, change default app for extension

    if test $status -eq 1; then
      echo "$bundle_id doesn't exist! Fix the script!"
      exit
    else
      echo -e "\nChanging $extension so it opens with $bundle_id …\n"
      duti -s $bundle_id .$extension all
      echo -e "Here's proof…\n"
      duti -x $extension
      echo -e "\n----------"
    fi
  done
