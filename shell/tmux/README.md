# shell/tmux

## Tmux workflow

- Create tmux session: `ts` alias for ` tmux new-session -s`, e.g. `ts <session-name>`.
- Attach tmux session: `ta` alias for `tmux attach -t`, e.g. `ta <session-name>`
- Detach tmux session: `C-t d`.

## Key

`C-t` so far is the best prefix key I found for `tmux`. The default prefix key is `C-b`, but I use
it for backward char.

List all keys: `tmux list-keys`

| Key                       | Description                 |
| ------------------------- | --------------------------- |
| prefix                    | C-t                         |
| prefix shift i            | Install plugins             |
| prefix shift u            | Update plugins              |
| prefix v                  | Split window vertically     |
| prefix s                  | Split window horizontally   |
| prefix C-t                | Show all tmux sessions      |
| Alt-shift-h/C-shift-left  | Select session window left  |
| Alt-shift-l/C-shift-right | Select session window right |
| Alt-shift-k/C-shift-up    | Select session up           |
| Alt-shift-j/C-shift-down  | Select session down         |
| prefix h/C-h              | Select pane Left            |
| prefix j/C-j              | Select pane Down            |
| prefix k/C-k              | Select pane Up              |
| prefix l/C-l              | Select pane Right           |
| prefix shift h            | Swap pane left              |
| prefix shift l            | Swap pane right             |
| prefix shift k            | Swap pane up                |
| prefix shift j            | Swap pane down              |
| prefix C-s                | Save                        |
| prefix C-r                | Restore                     |
| prefix :new -s <name>     | Create a new tmux session   |
| **prefix [**              | Enter copy mode             |
| v (in copy mode)          | Begin selection             |
| y (in copy mode)          | Yank                        |
| q (in copy mode)          | Quit copy mode              |
| prefix q                  | Kill window                 |
| prefix n                  | New window                  |
| prefix c                  | Kill pane                   |
| prefix C-c                | Kill session                |
| prefix shift r            | Reload source file          |
