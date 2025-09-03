# Neovim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Git shortcuts
alias gs="git status --porcelain"
alias gl="git pull"
alias gc="git commit"
alias glg="git log"
alias gr='git rebase'

# Docker aliases
alias dc=docker compose

# For MacOS only
if [[ "$(uname)" == "Darwin" ]]; then
  alias kape="caffeinate -d"
fi
