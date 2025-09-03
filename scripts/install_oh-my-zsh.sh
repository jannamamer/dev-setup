#!/usr/bin/env bash
set -eu

echo "Installing oh-my-zsh..."

/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "oh-my-zsh successfully installed..."