export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
export PYLINTHOME="$XDG_DATA_HOME/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
# Fro python3.7 and higher
# Set breakpoint() in Python to call pudb
export PYTHONBREAKPOINT="pudb.set_trace"

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYTHONPATH=$PYTHONPATH:.

# Anaconda
if [[ $(_os) == 'macos' ]]; then
  export PATH=$PATH:/usr/local/anaconda3/bin
  export PATH=$PATH:$HOME/Library/Python/3.8/bin
else
  export PATH=$PATH:$HOME/anaconda3/bin
fi

path=($PYENV_ROOT/bin $path)

_cache pyenv init - --no-rehash
