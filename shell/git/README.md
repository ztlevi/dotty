# [Git extras commands](https://github.com/tj/git-extras/blob/master/Commands.md)

# Git Setup

## Personal token as password

Git now uses personal tokens as password, go [here](https://github.com/settings/tokens) to create a
new token.

## (Deprecated) Credential Storage: default credential is stored in "~/.git-credentials".

https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage

## (Optional) SSH Setup

Setup SSH key to prevent typing username and password each time you operate your github:

1. Paste the text below, substituting in your GitHub email address.
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   This creates a new ssh key, using the provided email as a label.
2. Adding your SSH key to the ssh-agent, ensure ssh-agent is enabled:
   ```sh
   eval "$(ssh-agent -s)"
   ```
3. Add your SSH key to the ssh-agent. If you used an existing SSH key rather than generating a new
   SSH key, you'll need to replace id_rsa in the command with the name of your existing private key
   file.
   ```sh
   ssh-add ~/.ssh/id_rsa
   ```
4. Adding a new SSH key to your GitHub account 1)Copy the SSH key to your clipboard:
   ```sh
   $APT_INSTALL xclip
   xclip -sel clip < ~/.ssh/id_rsa.pub
   ```
5. Go to Github profile-->settings-->SSH and GPG keys-->New SSH key or Add SSH key-->paste ssh key
   you copy-->Add SSH key
6. Go to repo-->Clone or download-->Use SSH: git@github.com:ztlevi/Dotfiles.git
   ```sh
   git remote set-url origin git@github.com:ztlevi/Dotfiles.git
   ```

# [Forgit](https://github.com/wfxr/forgit)

- **Interactive `git add` selector** (`ga`)

[![screenshot](https://raw.githubusercontent.com/wfxr/i/master/forgit-ga.png)](https://raw.githubusercontent.com/wfxr/i/master/forgit-ga.png)

- **Interactive `git log` viewer** (`glo`)

[![screenshot](https://raw.githubusercontent.com/wfxr/i/master/forgit-glo.png)](https://raw.githubusercontent.com/wfxr/i/master/forgit-glo.png)

_The log graph can be disabled by option `FORGIT_LOG_GRAPH_ENABLE` (see discuss in
[issue #71](https://github.com/wfxr/forgit/issues/71))._

- **Interactive `.gitignore` generator** (`gi`)

[![screenshot](https://raw.githubusercontent.com/wfxr/i/master/forgit-gi.png)](https://raw.githubusercontent.com/wfxr/i/master/forgit-gi.png)

- **Interactive `git diff` viewer** (`gd`)

- **Interactive `git reset HEAD <file>` selector** (`grh`)

- **Interactive `git checkout <file>` selector** (`gcf`)

- **Interactive `git stash` viewer** (`gss`)

- **Interactive `git clean` selector** (`gclean`)

### Keybindings

|         Key         | Action                |
| :-----------------: | --------------------- |
|   <kbd>Tab</kbd>    | Toggle mark           |
|    <kbd>?</kbd>     | Toggle preview window |
|  <kbd>Alt-W</kbd>   | Toggle preview wrap   |
|  <kbd>Ctrl-S</kbd>  | Toggle sort           |
|  <kbd>Ctrl-R</kbd>  | Toggle selection      |
| <kbd>Ctrl-K/P</kbd> | Selection move up     |
| <kbd>Ctrl-J/N</kbd> | Selection move down   |
| <kbd>Alt-K/P</kbd>  | Preview move up       |
| <kbd>Alt-J/N</kbd>  | Preview move down     |
