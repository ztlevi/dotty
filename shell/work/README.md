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

Note: you might need to put `_load_all env.zsh` in `preload.zsh` because predefined zsh config might hard code PATH.
