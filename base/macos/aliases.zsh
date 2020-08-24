alias date=gdate

alias y=pbcopy
alias p=pbpaste

if _is_callable brew; then
  alias bru='brew update && brew upgrade && brew cleanup'
  alias brc='brew cask'
fi

alias stat="stat -x"
alias nt="nettop -cdP"

# OS X has no `md5sum`, so use `md5` as a fallback
_is_callable md5sum || alias md5sum="md5"
# OS X has no `sha1sum`, so use `shasum` as a fallback
_is_callable sha1sum || alias sha1sum="shasum"

_is_callable ggrep && alias grep="ggrep"

if [ -d '/Applications/ForkLift.app' ]; then
  alias oo="open -a ForkLift ."
  alias soo="sudo open -a ForkLift ."
else
  alias oo="sudo open ."
fi

alias cdicloud="cd '$HOME/Library/Mobile Documents/com~apple~CloudDocs'"

# Iterm
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
