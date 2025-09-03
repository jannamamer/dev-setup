#!/usr/bin/env bash
set -eu

# Skip if already configured
if git config --global user.name &>/dev/null; then
  echo "✅ Git is already configured."
  exit 0
fi

read -p "Enter your Git name: " git_name
read -p "Enter your Git email: " git_email

git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "vim"
