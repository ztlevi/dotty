_is_callable tensorboard && alias tb="tensorboard"
_is_callable bandwhich && alias bandwhich="sudo $(which bandwhich)"
_is_callable code && alias c.="code ."
_is_callable glances && alias glances="glances --theme-white"

# used for mas
function find-app-id() {
  /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/"$1".app/Contents/Info.plist
}
