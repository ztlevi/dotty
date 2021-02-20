# shell/work

The work directory structure at `.work` should look like this:

```sh
├── dots
│   ├── bin          # directory contains all executables
│   ├── aliases.zsh  # file contains aliases
│   ├── env.zsh      # file contains environment variables
│   ├── pre-load.zsh # pre load zsh config
│   ├── pre-load.zsh # post load zsh config
│   ├── local.el     # emacs local config
├── notes
```

Note: you might need to put `_load_all env.zsh` in `preload.zsh` because predefined zsh config might
hard code PATH.

## Hooks

### Here is an example hook function, it configs git user and email on the fly

```sh
_git_config_company_user() {
  if [[ $PWD == $HOME/workplace/* ]] || [[ $PWD == /workplace/* ]]; then
    if [[ -d "$PWD/.git" ]]; then
      git config user.name "Your Name"
      git config user.email "your-email@cc.com"
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
