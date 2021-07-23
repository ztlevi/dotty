
_init_path() {
    shopt -s nullglob
    paths=( ~/.local/bin $DOTTY_HOME/bin $DOTTY_HOME_CACHE/*.topic/bin )
    export PATH="$(printf '%s:' "${paths[@]}"):$PATH"
}
_init_path
