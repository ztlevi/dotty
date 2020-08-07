#!/usr/bin/env zsh

# Select a docker container to start and attach to
function dka() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Copied from https://github.com/pierpo/fzf-docker

_fzf_complete_dk() {
  # Get all Docker commands
  #
  # Cut below "Management Commands:", then exclude "Management Commands:",
  # "Commands:" and the last line of the help. Then keep the first column and
  # delete empty lines
  DOCKER_COMMANDS=$(
    docker --help 2>&1 >/dev/null |
      sed -n -e '/Management Commands:/,$p' |
      grep -v "Management Commands:" |
      grep -v "Commands:" |
      grep -v 'COMMAND --help' |
      grep .
  )

  ARGS="$@"
  if [[ $ARGS == 'dk ' ]]; then
    _fzf_complete "--reverse -n 1 --height=80%" "$@" < <(
      echo $DOCKER_COMMANDS
    )
  elif [[ $ARGS == 'dk tag'* || $ARGS == 'dk -f'* || $ARGS == 'dk run'* || $ARGS == 'dk push'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}\t{{.CreatedSince}}"
    )
  elif [[ $ARGS == 'dk rmi'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
    )
  elif [[ $ARGS == 'dk stop'* || $ARGS == 'dk rm'* || $ARGS == 'dk exec'* || $ARGS == 'dk kill'* || $ARGS == 'dk start'* || $ARGS == 'dk restart'* || $ARGS == 'dk logs'* ]]; then
    _fzf_complete "--multi --header-lines=1 " "$@" < <(
      docker ps --format "table {{.ID}}\\t{{.Image}}\\t{{.Names}}\\t{{.RunningFor}} ago\\t{{.Status}}\\t{{.Command}}"
    )
  fi
}

_fzf_complete_dk_post() {
  # Post-process the fzf output to keep only the command name and not the explanation with it
  awk '{print $1}'
}

[ -n "$BASH" ] && complete -F _fzf_complete_dk -o default -o bashdefault dk
