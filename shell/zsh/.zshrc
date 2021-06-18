if [[ -f $HOME/.work/dots/pre-load.zsh ]]; then source $HOME/.work/dots/pre-load.zsh; fi

_load shell/zsh/zinit.zsh

_load shell/zsh/config.zsh
_load shell/zsh/utils.zsh
_load shell/zsh/completion.zsh
_load shell/zsh/keybinds.zsh
_load shell/zsh/proxy.zsh

_load_all aliases.zsh

if [[ -f $HOME/.work/dots/post-load.zsh ]]; then source $HOME/.work/dots/post-load.zsh; fi
