alias ot="iterm-new-tab"
function iterm-new-tab() {
  local cdto="$PWD"
  local args="$@"

  if [ -d "$1" ]; then
    cdto=$(
      cd "$1"
      pwd
    )
    args="${@:2}"
  fi

  osascript -i <<EOF
        tell application "iTerm2"
            activate
            tell current window
                create tab with default profile
                tell the current session
                    write text "cd \"$cdto\" $args"
                end tell
            end tell
        end tell
EOF
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
