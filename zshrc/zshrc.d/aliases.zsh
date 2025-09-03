# Neovim
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# Git shortcuts
alias ga='git add'
alias gc="git commit "
alias gco="git checkout"
alias gd="git diff"
alias gl="git pull"
alias glg="git log --show-signature"
alias gp='git push'
alias gpnb='git push --set-upstream origin $(git_current_branch)'
alias gr='git rebase'
alias gs="git status --porcelain"
alias gu="git reset"

# Docker aliases
alias dc=docker compose

# For MacOS only
if [[ "$(uname)" == "Darwin" ]]; then
  alias kape="caffeinate -d"
fi
