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

echo "Clone zsh external plugins..."
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
echo "✅ Zsh external plugins cloned..."

echo "Copying Zsh configuration file..."
cp ./zshrc/.zshrc ~/.zshrc
echo "✅ Zsh configuration file copied."
