zinit wait lucid light-mode for soimort/you-get

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
