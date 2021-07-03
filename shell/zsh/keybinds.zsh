# The surround module wasn't working if KEYTIMEOUT was <= 10. Specifically,
# (delete|change)-surround immediately abort into insert mode if KEYTIMEOUT <=
# 8. If <= 10, then add-surround does the same. At 11, all these issues vanish.
# Very strange!
export KEYTIMEOUT=15

autoload -U is-at-least

# Define an init function and append to zvm_after_init_commands
function personal_bind_keys() {
  # Open current prompt in external editor
  autoload -Uz edit-command-line
  zle -N edit-command-line
  bindkey '^ ' edit-command-line

  bindkey -M viins '^K' kill-line
  bindkey -M viins '^U' backward-kill-line
  bindkey -M viins '^W' backward-kill-word
  bindkey -M viins '^H' backward-delete-char
  bindkey -M viins '^?' backward-delete-char # backspace key
  bindkey -M viins '^D' delete-char
  bindkey -M viins '^B' backward-char
  bindkey -M viins '^F' forward-char
  bindkey -M viins '^G' push-line-or-edit
  bindkey -M viins '^A' beginning-of-line
  bindkey -M viins '^E' end-of-line

  # Shift + Tab
  bindkey -M viins '^[[Z' reverse-menu-complete
}
zvm_after_init_commands+=(personal_bind_keys)
