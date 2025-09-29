#!/usr/bin/env bash

set -eu

source ./scripts/colors.sh

INSTALL_DIR="${INSTALL_DIR:-$HOME/.local}"
HOMEBREW_PREFIX="$INSTALL_DIR/homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

bold "Installing Homebrew..."
if command -v brew >/dev/null 2>&1; then
  bold "✅ Homebrew already installed."
else
  # Not sure if needed
  # # Prereqs (Linux only)
  # if [[ "$(uname)" == "Linux" ]]; then
  #   if command -v apt-get >/dev/null; then
  #     sudo apt-get update
  #     sudo apt-get install -y build-essential curl file git
  #   elif command -v dnf >/dev/null; then
  #     sudo dnf install -y gcc gcc-c++ make curl file git
  #   fi
  # fi

  export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
  export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
  export HOMEBREW_NO_ENV_HINTS=1
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Setup brew for current shell
  if [[ "$(uname)" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  bold "✅ Homebrew installed..."
fi

echo
bold "Installing packages via Homebrew..."
brew bundle --file="$PWD/brewfiles/Brewfile.base" | sed $'s/^/\t/'
bold "✅ Homebrew packages installed..."
