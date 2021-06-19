zinit wait lucid for \
  OMZP::tmux
# OMZP::tmuxinator
# zinit ice as"completion"; zinit snippet OMZ::plugins/tmux-cssh/_tmux-cssh

alias tmux='tmux -f "$TMUX_HOME/tmux.conf"'

alias ta='tmux attach -t'
alias tl='tmux ls'
alias tksv='tmux kill-server'
alias trs='tmux rename-session'
alias trw='tmux rename-window'

function tkss() {
  if [[ -n $(tmux ls | rg $1) ]]; then
    tmux kill-session -t $1
  fi
}

alias tshow="tmux new-session 'nvim' \; split-window -h 'cmatrix -C red' \;
  split-window -v 'ranger $HOME' \; attach"

if [[ -n "$TMUX" ]]; then # From inside tmux
  # Detach all other clients to this session
  alias mine='tmux detach -a'
  # Send command to other tmux window
  tt() { tmux send-keys -t .+ C-u && tmux set-buffer "$*" && tmux paste-buffer -t .+ && tmux send-keys -t .+ Enter; }
  # Create new session (from inside one)
  tn() {
    local name="${1:-$(basename $PWD)}"
    TMUX= tmux new-session -d -s "$name"
    tmux switch-client -t "$name"
    tmux display-message "Session #S created"
  }
else # From outside tmux
  # Start grouped session so I can be in two different windows in one session
  tdup() { tmux new-session -t "${1:-$(tmux display-message -p '#S')}"; }
fi
