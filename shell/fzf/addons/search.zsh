#!/usr/bin/env zsh

# using ripgrep combined with preview, then open with EDITOR
# search-project - usage: sp <searchTerm>
unalias sp 2>/dev/null
sp() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi
  rg --files-with-matches --no-messages "$1" |
    fzf --preview "highlight -O ansi -l {} 2> /dev/null | \
      rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || \
      rg --ignore-case --pretty --context 10 '$1' {}" |
    xargs -I{} ${EDITOR} {}
}

# alternative using ripgrep-all (rga) combined with fzf-tmux preview
# implementation below makes use of "open" on macOS, which can be replaced by other commands if needed.
# allows to search in PDFs, E-Books, Office documents, zip, tar.gz, etc. (see https://github.com/phiresky/ripgrep-all)
# search-project-all - usage: spa <searchTerm> or spa "string with spaces" or spa "regex"
spa() {
  _is_callable rga || echo "Please install ripgrep-all first, yay -S ripgrep-all or brew install rga."
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!"
    return 1
  fi
  local file
  file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$@" |
    fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$@"' {}")"
  case $(_os) in
  macos)
    open ${file}
    ;;
  linux-*)
    xdg-open ${file}
    ;;
  esac
}

rga-fzf() {
  RG_PREFIX="rga --files-with-matches"
  local file
  file="$(
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
      fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
      --phony -q "$1" \
      --bind "change:reload:$RG_PREFIX {q}" \
      --preview-window="70%:wrap"
  )" &&
    echo "opening $file" &&
    open "$file"
}
