if _is_callable hub; then
  alias git='noglob hub'
else
  alias git='noglob git'
fi
alias "gci"="hub ci-status --verbose"
