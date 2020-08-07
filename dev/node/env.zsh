export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/node/repl_history

export NODENV_ROOT=$XDG_DATA_HOME/nodenv
export NODE_VERSION=12.10.0
export NPM_GLOBAL_DIR=$XDG_DATA_HOME/nodenv/versions/$NODE_VERSION

path=($NODENV_ROOT/bin $NPM_GLOBAL_DIR/bin $path)

_cache nodenv init - --no-rehash
