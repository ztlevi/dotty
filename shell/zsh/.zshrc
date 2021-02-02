# Load Antigen bundles first
_load shell/zsh/bundles.zsh
_load shell/zsh/fasd.zsh

_load shell/zsh/config.zsh
_load shell/zsh/utils.zsh
_load shell/zsh/completion.zsh
_load shell/zsh/keybinds.zsh
_load shell/zsh/proxy.zsh

_load_all aliases.zsh

if [ -f ${0:A:h}/local.zsh ]; then
  source ${0:A:h}/local.zsh
fi
