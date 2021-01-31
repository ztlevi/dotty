# Define an init function and append to zvm_after_init_commands
function personal_fzf_bind_keys() {
  bindkey '^[x' fzf-history-widget
  bindkey '^[p' fzf-file-widget
  bindkey '^r' fzf-history-widget
  bindkey "^I" fzf-completion
}
zvm_after_init_commands+=(personal_fzf_bind_keys)

for file in ${0:A:h}/addons/*.zsh; do
  source ${file}
done
