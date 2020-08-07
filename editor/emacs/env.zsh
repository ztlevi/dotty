path=(~/.emacs.d/bin $path)
if [ -d '/usr/local/opt/emacs-plus' ]; then
  path=(/usr/local/opt/emacs-plus/bin $path)
else
  path=(/usr/local/opt/emacs-mac/bin $path)
fi
