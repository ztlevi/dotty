# Load Antigen bundles first
[[ -f $HOME/.work/dots/pre-load.zsh ]] && source $HOME/.work/dots/pre-load.zsh

_load shell/zsh/bundles.zsh
_load shell/zsh/fasd.zsh

_load shell/zsh/config.zsh
_load shell/zsh/utils.zsh
_load shell/zsh/completion.zsh
_load shell/zsh/keybinds.zsh
_load shell/zsh/proxy.zsh

_load_all aliases.zsh

[[ -f $HOME/.work/dots/post-load.zsh ]] && source $HOME/.work/dots/post-load.zsh
