export GNUPGHOME="$HOME/.gnupg"
export TERMINFO="$XDG_CONFIG_HOME/terminfo"
export BROWSER=google-chrome

# CUDA
if [ -d /usr/local/cuda/ ]; then
  path=(/usr/local/cuda/bin $path)
fi
