#!/usr/bin/env sh

path="$1"   # Full path of the selected file
width="$2"  # Width of the preview pane (number of fitting characters)
height="$3" # Height of the preview pane (number of fitting characters)
maxln=54    # Stop after $maxln lines.  Can be used like ls | head -n $maxln

# Find out something about the file:
mimetype=$(file --mime-type -Lb "$path")
extension=${path##*.}

try() { output=$(eval '"$@"'); }
dump() { echo "$output"; }
trim() { head -n "$maxln"; }
hl() {
  command head -n "$maxln" "$path" | highlight --syntax="$extension" --out-format=ansi
  test $? = 0 -o $? = 141
}

case "$mimetype" in
# Syntax highlight for text files:
text/* | */xml)
  try hl && {
    dump | trim
    exit 5
  } || exit 2
  ;;
esac
exit 1
