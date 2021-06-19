zinit wait lucid for OMZP::brew
# zinit ice svn wait lucid; zinit snippet OMZP::osx
zinit wait lucid for \
  atclone"touch music spotify _security" atpull"%atclone" 'OMZP::osx'

alias date=gdate

alias y=pbcopy
alias p=pbpaste

if _is_callable brew; then
  alias bru='brew update && brew upgrade && brew cleanup'
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
  alias oo="open ."
fi

alias cdicloud="cd '$HOME/Library/Mobile Documents/com~apple~CloudDocs'"
