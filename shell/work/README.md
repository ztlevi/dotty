# shell/work

The work directory structure `$HOME/dev/work` should look like this:

```sh
├── dots
│   ├── bin          # directory contains all executables
│   ├── rc.zsh  # file contains aliases
│   ├── env.zsh      # file contains environment variables
│   ├── pre-load.zsh # pre load zsh config
│   ├── pre-load.zsh # post load zsh config
│   ├── local.el     # emacs local config
│   ├── tmux.conf    # tmux local config
├── notes            # my org nots directory
```

Note: you might need to put `_load_all env.zsh` in `preload.zsh` because predefined zsh config might
hard code PATH.

## Hooks

### Here is an example hook function, it configs git user and email on the fly

```sh
_git_config_company_user() {
  local my_email="your-email@cc.com"
  if [[ $PWD == $HOME/workplace/* ]] || [[ $PWD == /workplace/* ]] || [[ $PWD == /Volumes/workplace/* ]]; then
    if [[ -d "$PWD/.git" ]] && [[ $(git config --get user.signingkey) != "$my_email" ]]; then
      git config user.name "Your Name"
      git config user.email "$my_email"
      git config user.signingkey "$my_email"
    fi
  fi
}

# Hook onto `chpwd` in the right way
# with the official util add-zsh-hook
# load add-zsh-hook if it's not available yet
(($ + functions[add - zsh - hook])) || autoload -Uz add-zsh-hook
add-zsh-hook chpwd _git_config_company_user
```

### Additional info

list existing hook functions `add-zsh-hook -L` or `add-zsh-hook -L chpwd`
