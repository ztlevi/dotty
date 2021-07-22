zman() { PAGER="less -g -I -s '+/^       "$1"'" man zshall; }

# aliases common to all shells
alias q=exit
alias pv=printenv
alias open=open_command
alias clr=clear
alias sudo='sudo '
alias which=type
k9() {
  # Usage: k9 22234 1213 or k9 chrome
  if echo $@ | rg -q "[\d\s\t]+"; then
    process_ids=("${(@f)}$@")
  else
    process_ids=("${(@f)$(pgrep -i $1)}")
  fi
  kill -9 ${process_ids[@]} || "no process found by searching $@"
}
sk9() {
  # Usage: k9 22234 1213 or k9 chrome
  if echo $@ | rg -q "[\d\s\t]+"; then
    process_ids=("${(@f)}$@")
  else
    process_ids=("${(@f)$(pgrep -i $1)}")
  fi
  sudo kill -9 ${process_ids[@]} || "no process found by searching $@"
}
alias ka=killall

_is_callable dust && alias du=dust
alias dud="du -d 1"

_is_callable exa && alias ls="exa"
alias ls="${aliases[ls]:-ls} --color=auto --group-directories-first"
alias ll="ls -lgh"
alias la='ls -laFh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias ln="${aliases[ln]:-ln} -v" # verbose ln
alias mkdir='mkdir -p'
unalias fd 2>/dev/null

alias gurl='curl --compressed'
alias wget='wget -c' # Resume dl if possible

alias ag="noglob ag -p $XDG_CONFIG_HOME/ag/agignore"
alias rg='noglob rg'
alias prg="ps aux | rg -i"
function grep_search() { echo $2 | grep -qiP $1; }
function rg_search() { echo $2 | rg -qS $1; }
function vread() {
  (
    $@ > /tmp/dummy_vread_file
    nvim -c 'set ft=man' /tmp/dummy_vread_file
    rm -f /tmp/dummy_vread_file
  )
}

# For example, to list all directories that contain a certain file: find . -name .gitattributes | map dirname
alias xmap="xargs -n1"

# Convenience
alias mk=make
if _is_callable bat; then
  alias bat="bat --theme OneHalfLight"
  alias cat=bat
fi
_is_callable neofetch && alias nf="neofetch"
_is_callable cmatrix && alias cm="cmatrix -C red"

take() { mkdir "$1" && cd "$1"; }
hex() { echo -n $@ | xxd -psdu; }

function format-all-dos2unix() {
  if [[ -z $1 ]]; then
    echo "Missing file extension as first argument, e.g. java..."
  fi
  for filename in ./**/*.$1; do
    dos2unix $filename
  done
}

unalias duf 2>/dev/null
