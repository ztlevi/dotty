#!/usr/bin/env zsh

# Switch projects
function fzf_projects() {
  # Each root is consist of PATH:scan_depth
  project_scans=("${HOME}:1" "${HOME}/Dropbox:1" "${HOME}/go/src:1" "${HOME}/dev:2" "${HOME}/workplace:3"
    "${XDG_CONFIG_HOME}:1")

  projects=()
  local project scan_depth
  for project_scan in ${project_scans[@]}; do
    IFS=: read -r project scan_depth <<<"${project_scan}"
    project="$(readlink $project || echo $project)"
    if [[ -d ${project} ]]; then
      # Suppress errors, some dirs, e.g. .Trash, sometimes are not readable
      {
        for dir in $(find ${project} -maxdepth ${scan_depth} -type d); do
          if [[ -d ${dir}/.git ]]; then
            projects+=(${dir})
          fi
        done
      } 2>/dev/null
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

fman() {
  man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}
