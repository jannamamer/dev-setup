#!/usr/bin/env bash
# Usage: install.sh <git_platform>
set -eu

source ./scripts/colors.sh

export INSTALL_DIR="$HOME/.local"
export PATH="$INSTALL_DIR/bin:$INSTALL_DIR/homebrew/bin:$PATH"

bold "Setting up development environment..." && echo

./scripts/install_brew.sh && echo

bold "Setting up zsh..."
./scripts/setup_zsh.sh | sed $'s/^/\t/'
bold "✅ Zsh setup complete..." && echo

bold "Setting up nvim..."
./scripts/setup_nvim.sh | sed $'s/^/\t/'
bold "✅ Nvim setup complete..." && echo

bold "Installing Dev Tools..."
./scripts/install_dev-tools.sh | sed $'s/^/\t/'
bold "✅ Dev Tools installed..." && echo

bold "Setting up git..."
./scripts/setup_git.sh | sed $'s/^/\t/'
bold "✅ Git setup complete..." && echo

bold "✅ Setup complete..."
