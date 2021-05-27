#!/usr/bin/env zsh
# Tutorial: https://developer.atlassian.com/blog/2015/03/emacs-intellij/
# Name: Open in Emacs
# Program: /Users/ztlevi/.dotty/intellij_open_in_emacs.sh
# Arguments: $FilePath$ $LineNumber$ $ColumnNumber$
# Working directory: $FileDir$
# Advanced Options: Uncheck open counsel for tool output
# https://ws3.sinaimg.cn/large/006tNc79ly1fzma8zswoij318f0u0jxt.jpg

file=$1
line=$2
col=$3
emacsclient -n -e \
  "(progn

       ;; Load the file
       (find-file \"$file\")

       ;; Jump to the same point as in IntelliJ
       ;; Unfortunately, IntelliJ doesn't always supply the values
       ;; depending on where the open is invoked from; e.g. keyboard
       ;; works, tab context doesn't
       (when (not (string= \"\" \"$line\"))
         (goto-char (point-min))
         (forward-line (1- $line))
         (forward-char (1- $col)))

       ;; Raise/focus our window; depends on the windowing system
       (if (string-equal system-type \"darwin\")
         (do-applescript \"tell application \\\"Emacs\\\" to activate\")
         (raise-frame))

       ;; Automatically pick up changes made in IntelliJ
       (auto-revert-mode t))"
