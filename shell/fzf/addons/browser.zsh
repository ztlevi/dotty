#!/usr/bin/env zsh

# c - browse chrome history on OSX/Linux
c() {
  if [[ -z "$1" ]]; then
    chrome_user=Default
  else
    chrome_user="Profile $1"
  fi
  local cols sep google_history open
  cols=$((COLUMNS / 3))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="${HOME}/Library/Application Support/Google/Chrome/${chrome_user}/History"
    open=open
  else
    google_history="${HOME}/.config/google-chrome/${chrome_user}/History"
    open=xdg-open
  fi
  rm -f /tmp/chrome-history
  cp -f "$google_history" /tmp/chrome-history
  sqlite3 -separator $sep /tmp/chrome-history \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
    awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
    fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open >/dev/null 2>/dev/null
}

# b - browse chrome bookmarks on OSX
b() {
  if [[ -z "$1" ]]; then
    chrome_user=Default
  else
    chrome_user="Profile $1"
  fi
  if [ "$(uname)" = "Darwin" ]; then
    bookmarks_path="${HOME}/Library/Application Support/Google/Chrome/${chrome_user}/Bookmarks"
    open=open
  else
    bookmarks_path=$XDG_CONFIG_HOME/google-chrome/${chrome_user}/Bookmarks
    open=xdg-open
  fi

  jq_script='
        def ancestors: while(. | length >= 2; del(.[-1,-2]));
        . as $in | paths(.url?) as $key | $in | getpath($key) | {name,url, path: [$key[0:-2] | ancestors as $a | $in | getpath($a) | .name?] | reverse | join("/") } | .path + "/" + .name + "\t" + .url'

  jq -r $jq_script <"$bookmarks_path" |
    sed -E $'s/(.*)\t(.*)/\\1\t\x1b[36m\\2\x1b[m/g' |
    fzf --ansi |
    cut -d$'\t' -f2 |
    xargs $open
}
