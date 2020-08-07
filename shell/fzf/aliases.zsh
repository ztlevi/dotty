bindkey -M viins '^[x' fzf-history-widget
bindkey -M viins '^[p' fzf-file-widget
bindkey -M viins "^r" fzf-history-widget
bindkey "^I" fzf-completion

for file in ${0:A:h}/addons/*.zsh; do
  source ${file}
done
