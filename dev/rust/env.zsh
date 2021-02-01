export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

source "$CARGO_HOME/env"
path=($CARGO_HOME/bin $path)
