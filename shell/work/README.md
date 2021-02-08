# shell/work

The work directory structure at `.work` should look like this:

```sh
├── dots
│   ├── bin          # directory contains all executables
│   ├── aliases.zsh  # file contains aliases
│   ├── env.zsh      # file contains environment variables
│   ├── preload.zsh  # company predefined zshrc
├── notes
```

Note: you might need to put `_load_all env.zsh` in `preload.zsh` because predefined zshrc might hard code PATH.
