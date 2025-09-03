#!/usr/bin/env bash
# Usage: install.sh <git_platform>
set -eu

export INSTALL_DIR="$HOME/.local"
export PATH="$INSTALL_DIR/bin:$INSTALL_DIR/homebrew/bin:$PATH"

echo "Setting up development environment..."

echo "Installing Homebrew..."
./scripts/install_brew.sh

echo "Installing packages via Homebrew..."
brew bundle --file="$PWD/brewfiles/Brewfile.base"
echo "✅ Homebrew packages installed..."

echo "Setting up dotfiles..."
./scripts/setup_dotfiles.sh

echo "Installing Dev Tools..."
./scripts/install_dev-tools.sh

echo "Configure Git Credentials..."
./scripts/configure_git.sh

echo "Setup complete..."