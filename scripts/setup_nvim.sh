#!/usr/bin/env bash
set -eu

echo "Setting up env variables..."
cp ./config.env ~/.config.env
echo "✅ env variables deployed..."

echo "Downloading vim-plug..."
if [ -f $HOME/.config/nvim/autoload/plug.vim ]; then
  echo "✅ vim-plug already downloaded..."
else
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "✅ vim-plug downloaded..."
fi

echo "Copying nvim files and folders..."
mkdir -p ~/.config/nvim
cp -r ./nvim/ ~/.config/nvim/
echo "✅ nvim files and folders copied..."

echo "Installing plugins..."
nvim --headless +PlugInstall +qall
nvim --headless +TSUpdate +qall
echo && echo "✅ Plugins installed..."
