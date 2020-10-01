function string_join() {
  local IFS="$1"
  shift
  echo "$*"
}

center_text() {
  # Function "center_text": center the text with a surrounding border

  # first argument: text to center
  # second argument: glyph which forms the border
  # third argument: width of the padding

  local terminal_width=$(tput cols) # query the Terminfo database: number of columns
  local text="${1:?}"               # text to center
  local glyph="${2:-=}"             # glyph to compose the border
  local padding="${3:-2}"           # spacing around the text

  local text_width=${#text}

  local border_width=$(((terminal_width - (padding * 2) - text_width) / 2))

  local border= # shape of the border

  # create the border (left side or right side)
  for ((i = 0; i < border_width; i++)); do
    border+="${glyph}"
  done

  # a side of the border may be longer (e.g. the right border)
  if (((terminal_width - (padding * 2) - text_width) % 2 == 0)); then
    # the left and right borders have the same width
    local left_border=$border
    local right_border=$left_border
  else
    # the right border has one more character than the left border
    # the text is aligned leftmost
    local left_border=$border
    local right_border="${border}${glyph}"
  fi

  # space between the text and borders
  local spacing=

  for ((i = 0; i < $padding; i++)); do
    spacing+=" "
  done

  # displays the text in the center of the screen, surrounded by borders.
  printf "${left_border}${spacing}${text}${spacing}${right_border}\n"
}

function update_topics {
  declare -a topics
  topics=( "$DOTFILES_DATA"/*.topic(N) )
  for topic in ${${${topics[@]#$DOTFILES_DATA/}%.topic}/.//}; do
    # Skip update shell/git
    if [[ ${topic} == "shell/git" ]]; then
      continue
    fi
    ${DOTFILES}/deploy -l ${topic}
  done
}

function update_git_repo() {
  local ERROR_SUMMARY_FILE=/tmp/update_my_repos_error_summary
  dir=$1
  diff_str=$(
    cd $dir
    git diff
  )
  if [[ -d ${dir} && -z ${diff_str} ]]; then
    for repo in $@; do
      (cd ${repo} && git pull)
    done
  else
    echo "${dir} repo is dirty..." >>${ERROR_SUMMARY_FILE}
  fi
}

function update_my_repos() {
  local ERROR_SUMMARY_FILE=/tmp/update_my_repos_error_summary
  rm -f ${ERROR_SUMMARY_FILE} && touch ${ERROR_SUMMARY_FILE}

  local ANTIGEN_SUMMARY_FILE=/tmp/antigen_update_summary
  {
    update_git_repo ${HOME}/Dotfiles
    (
      cd ${HOME}/Dotfiles
      git submodule update -- assets
      update_topics &>/dev/null
    )
  } &
  PID1=$!
  update_git_repo ${HOME}/.doom.d &
  PID2=$!
  update_git_repo ${ZSH} &
  PID3=$!
  antigen update >${ANTIGEN_SUMMARY_FILE} &
  PID4=$!

  wait ${PID1}
  wait ${PID2}
  wait ${PID3}
  wait ${PID4}

  _cache_clear

  echo ${fg_bold[white]}${bg[blue]}"$(center_text 'Doom Sync Summary' '>')"${reset_color}
  doom sync

  echo ${fg_bold[white]}${bg[blue]}"$(center_text 'Antigen Summary' '>')"${reset_color}
  cat ${ANTIGEN_SUMMARY_FILE}

  echo ${fg_bold[white]}${bg[red]}"$(center_text 'Error Summary' '>')"${reset_color}
  cat ${ERROR_SUMMARY_FILE}

  rm -f ${ERROR_SUMMARY_FILE} ${ANTIGEN_SUMMARY_FILE}
}
alias uu='update_my_repos'
