alias xx="xmodmap $DOTTY_HOME/desktop/general/Xmodmap_linux"
alias xh="xmodmap $DOTTY_HOME/desktop/general/Xmodmap_hhkb"

if _is_callable xdg-open; then
  alias oo="xdg-open . >/dev/null &"
  alias soo="sudo xdg-open . >/dev/null &"
elif _is_callable xdg-open; then
  alias oo="gvfs-open . >/dev/null &"
  alias soo="sudo gvfs-open . >/dev/null &"
fi

# The first is the classname and the second is the class
alias get_window_class="xprop | grep WM_CLASS"
alias wm2="Xephyr -br -ac -noreset -screen 1920x1080 :1 &"
