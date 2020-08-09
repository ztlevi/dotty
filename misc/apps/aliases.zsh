_is_callable tensorboard && alias tb="tensorboard"
_is_callable bandwhich && alias bandwhich="sudo $(which bandwhich)"
_is_callable code && alias c.="code ."
_is_callable cspell && alias cspell-all="cspell --config '$HOME/misc/apps/.cspell.json' '**/*.{js,jsx,ts,tsx,c,cc,cpp,h,hh,hpp,go,json,py}'"
_is_callable black && alias format-all-black='black -q **/*.py'
_is_callable autoflake && alias remove-py-imports="git diff --name-only origin/develop | xargs -I{} autoflake --in-place --remove-all-unused-imports {}"
_is_callable prettier && alias format-all-prettier='prettier --write "**/*.{js,ts,jsx,tsx,json,css,scss,md}"'
if _is_callable clang-format; then
  # alias format-all-clang="find . -regex '.*\.\(cpp\|hpp\|cc\|cxx\|h\)' -exec clang-format -style=file -i {} \;"
  alias format-all-clang="fd -x clang-format -i -style=file {} \; -e c -e cc -e cpp -e h -e hh -e hpp . ."
fi

if _is_callable reveal-md; then
  alias rv='reveal-md --highlight-theme github --theme white --watch'
  alias rvs='reveal-md --highlight-theme github --theme white --static revealjs_output'
fi
_is_callable you-get && alias yg='you-get'
if _is_callable youtube-dl; then
  alias yd='youtube-dl --write-auto-sub --ignore-errors'
  alias yd2mp4='youtube-dl --write-auto-sub --ignore-errors --recode-video mp4'
  alias yda='youtube-dl --extract-audio --audio-format mp3'
fi

function find-app-id() {
  /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/"$1".app/Contents/Info.plist
}