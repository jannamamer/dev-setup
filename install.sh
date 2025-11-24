#!/usr/bin/env bash

set -eu

source ./scripts/colors.sh
source config.env

export INSTALL_DIR="$HOME/.local"
export PATH="$INSTALL_DIR/bin:$INSTALL_DIR/homebrew/bin:$PATH"

bold "Setting up development environment..." && echo

source ./scripts/install_brew.sh && echo

bold "Setting up zsh..."
source ./scripts/setup_zsh.sh | sed $'s/^/\t/'
bold "✅ Zsh setup complete..." && echo

bold "Setting up nvim..."
source ./scripts/setup_nvim.sh | sed $'s/^/\t/'
bold "✅ Nvim setup complete..." && echo

bold "Installing Dev Tools..."
source ./scripts/install_dev-tools.sh | sed $'s/^/\t/'
bold "✅ Dev Tools installed..." && echo

if [ "$VSCODE_TOOLS" = "true" ]; then
	bold "Setting up VS Code..."
	source ./scripts/setup_vscode.sh | sed $'s/^/\t/'
	bold "✅ VS Code setup complete..." && echo
fi

bold "Setting up git..."
source ./scripts/setup_git.sh | sed $'s/^/\t/'
bold "✅ Git setup complete..." && echo

bold "✅ Setup complete..."
