# shell/herdr

[herdr](https://herdr.dev) — an agent multiplexer that lives in your terminal. Manages AI coding
agents across workspaces, tabs, and panes with persistent sessions, agent-status awareness, and
remote (SSH) support.

Config lives at `~/.config/herdr/config.toml` (symlinked from `config/shell/herdr/config.toml`).
Print the authoritative defaults with `herdr --default-config`.

## Key

The prefix is `C-t` to match the `tmux` topic (herdr ships with `C-b`, which is kept for backward
char). Keybindings mirror `tmux` and `zellij` so muscle memory carries over. `prefix h` means press
the prefix, then `h`.

| Key                  | Description                   |
| -------------------- | ----------------------------- |
| prefix               | C-t                           |
| prefix n             | New tab                       |
| prefix p             | Previous tab                  |
| prefix shift p       | Next tab                      |
| Alt-shift-h/l        | Prev/next tab                 |
| prefix 1..9          | Switch to tab                 |
| prefix shift t       | Rename tab                    |
| prefix shift x       | Close tab                     |
| prefix h/j/k/l       | Focus pane left/down/up/right |
| prefix shift h/j/k/l | Swap pane left/down/up/right  |
| prefix tab           | Cycle to next pane            |
| prefix shift tab     | Cycle to previous pane        |
| prefix v             | Split pane vertically         |
| prefix s             | Split pane horizontally       |
| prefix x             | Close pane                    |
| prefix z             | Zoom pane                     |
| prefix r             | Resize mode                   |
| prefix b             | Toggle sidebar                |
| **prefix [**         | Enter copy mode               |
| prefix d             | Detach                        |
| prefix g             | Session navigator             |
| prefix w             | Workspace picker              |
| prefix shift n       | New workspace                 |
| prefix shift w       | Rename workspace              |
| prefix shift d       | Close workspace               |
| prefix shift g       | New worktree                  |
| prefix shift 1..9    | Switch workspace              |
| h/j/k/l (nav mode)   | Focus pane left/down/up/right |
