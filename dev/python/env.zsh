export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
export PYLINTHOME="$XDG_DATA_HOME/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
# For python3.7 and higher
# Set breakpoint() in Python to call pudb
export PYTHONBREAKPOINT="pudb.set_trace"

export PYTHONPATH=$PYTHONPATH:.

export PYTHON_VERSION=3.9.1
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
