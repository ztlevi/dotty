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
com.readdle.PDFExpert-Mac:pdf

abnerworks.Typora:markdown
abnerworks.Typora:md
abnerworks.Typora:mdwn

org.gnu.Emacs:sh
org.gnu.Emacs:bash
org.gnu.Emacs:zsh
org.gnu.Emacs:c
org.gnu.Emacs:cc
org.gnu.Emacs:cpp
org.gnu.Emacs:h
org.gnu.Emacs:hh
org.gnu.Emacs:hpp
org.gnu.Emacs:cmake
org.gnu.Emacs:text
org.gnu.Emacs:txt
org.gnu.Emacs:xml
org.gnu.Emacs:json
org.gnu.Emacs:el
org.gnu.Emacs:elc
org.gnu.Emacs:go
org.gnu.Emacs:java
org.gnu.Emacs:js
org.gnu.Emacs:jsx
org.gnu.Emacs:kt
org.gnu.Emacs:kts
org.gnu.Emacs:tex
org.gnu.Emacs:bbl
org.gnu.Emacs:org
org.gnu.Emacs:py
org.gnu.Emacs:rs
org.gnu.Emacs:html
org.gnu.Emacs:css

com.colliderli.iina:mp4
com.colliderli.iina:mpeg
com.colliderli.iina:mov
com.colliderli.iina:mkv
com.colliderli.iina:rmvb
com.colliderli.iina:wmv
com.colliderli.iina:webm
com.colliderli.iina:flv
com.colliderli.iina:avi

com.netease.163music:mp3
com.netease.163music:wav
com.netease.163music:aac
com.netease.163music:ogg
com.netease.163music:wma
com.netease.163music:flac
com.netease.163music:alac

com.trendmicro.DrUnzip:gz
com.trendmicro.DrUnzip:7z
com.trendmicro.DrUnzip:rar
com.trendmicro.DrUnzip:tar
com.trendmicro.DrUnzip:zip
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
