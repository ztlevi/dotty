# Resolve some java application issue
if [[ "$XDG_SESSION_DESKTOP" = "bspwm" ]]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  _is_callable wmname && wmname compiz
fi
