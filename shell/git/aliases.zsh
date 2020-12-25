alias git='noglob git'
alias g="git"
alias gci="gh pr checks"
alias gcpr="gh pr create --assignee ztlevi"

local SINGING_KEY=$(git config --global --get user.signingkey)
if [[ -n "$SSH_CONNECTION" ]]; then
  git config --global --unset user.signingkey
  git config --global --unset commit.gpgsign
  git config --global --unset tag.gpgsign
elif [[ -z "$SINGING_KEY" ]]; then
  git config --global --add user.signingkey ztlevi.work@gmail.com
  git config --global --add commit.gpgsign true
  git config --global --add tag.gpgsign true
fi
