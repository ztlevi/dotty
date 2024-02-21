#!/usr/bin/env bash

# Rectangle setup, see ~/Library/Preferences/com.knollsoft.Rectangle.plist
defaults write com.knollsoft.Rectangle leftHalf '{keyCode = 4; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle rightHalf '{keyCode = 37; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle maximize '{keyCode = 46; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle almostMaximize '{keyCode = 45; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle bottomHalf '{keyCode = 38; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle topHalf '{keyCode = 40; modifierFlags = 1310720;}'
defaults write com.knollsoft.Rectangle launchOnLogin -bool true
defaults write com.knollsoft.Rectangle hideMenubarIcon -bool true
defaults write com.knollsoft.Rectangle windowSnapping -int 2
defaults write com.knollsoft.Rectangle subsequentExecutionMode -int 1

echo "You need to restart Rectangle app to apply changes."
