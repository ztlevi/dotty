#!/usr/bin/env zsh

# Switch projects
function fzf_projects() {
  # Each root is consist of PATH:scan_depth
  project_scans=("${HOME}:1" "${HOME}/Dropbox:1" "${HOME}/go/src:1" "${HOME}/Developer:2")

  projects=()
  local project scan_depth
  for project_scan in ${project_scans[@]}; do
    IFS=: read -r project scan_depth <<<"${project_scan}"
    if [[ -d ${project} ]]; then
      for dir in $(find ${project} -maxdepth ${scan_depth} -type d); do
        if [[ -d ${dir}/.git ]]; then
          projects+=(${dir})
        fi
      done
    fi
  done

  local IFS=$'\n'
  selected_project=$(echo "${projects[*]}" | fzf)

  cd ${selected_project}
}
alias pp=fzf_projects

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

unalias z 2>/dev/null
# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
z() {
  [ $# -gt 0 ] && fasd_cd -d "$*" && return
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

fman() {
  man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
