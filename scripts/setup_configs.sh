#!/usr/bin/env bash
set -eu
echo "Setting up env variables..."
cp ./config.env ~/.config.env
echo "✅ env variables deployed."

echo "Setting up Zsh config..."
mkdir -p ~/.zshrc.d
cp -r ./zshrc/zshrc.d/* ~/.zshrc.d/

cp ./zshrc/.zshrc ~/.zshrc
echo "✅ Zsh config deployed."

echo "Setting up Vim config..."
if [ -d ~/.config/nvim/autoload/plug.vim ]; then
  echo "✅ vim-plug is already installed."
else
  echo "Downloading vim-plug..."
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Copying plugins folder..."
mkdir -p ~/.config/nvim/plugins
cp -r ./nvim/plugins/ ~/.config/nvim/plugins/
echo "✅ plugins folder copied..."

echo "Copying ftplugin folder..."
mkdir -p ~/.config/nvim/ftplugin
cp -r ./nvim/ftplugin/ ~/.config/nvim/ftplugin/
echo "✅ ftplugin folder copied..."

echo "Copying nvim configuration file..."
cp ./nvim/init.vim ~/.config/nvim/init.vim
nvim +PlugInstall +qall

echo "✅ Vim config deployed."
