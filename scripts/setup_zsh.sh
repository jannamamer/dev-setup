#!/usr/bin/env bash
set -eu

echo "Copying modular configs folder..."
mkdir -p ~/.zshrc.d
cp -r ./zshrc/zshrc.d/* ~/.zshrc.d/
echo "✅ modular configs folder copied..."

echo "Installing oh-my-zsh..."
if [ -d ~/.oh-my-zsh ]; then
  echo "✅ oh-my-zsh already installed ..."
else
   export RUNZSH=no
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅ oh-my-zsh successfully installed..."
fi

echo "Copying custom theme..."
cp ./zshrc/custom-af-magic.zsh-theme ~/.oh-my-zsh/custom/themes/custom-af-magic.zsh-theme
echo "✅ Custom theme copied..."

echo "Copying Zsh configuration file..."
cp ./zshrc/.zshrc ~/.zshrc
echo "✅ Zsh configuration file copied."
