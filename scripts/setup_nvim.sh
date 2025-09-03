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

echo "Copying ftplugin folder..."
mkdir -p ~/.config/nvim/ftplugin
cp -r ./nvim/ftplugin/* ~/.config/nvim/ftplugin/
echo "✅ ftplugin folder copied..."

echo "Copying plugins folder..."
mkdir -p ~/.config/nvim/plugins
cp -r ./nvim/plugins/* ~/.config/nvim/plugins/
echo "✅ plugins folder copied..."

echo "Copying nvim configuration file..."
cp ./nvim/init.vim ~/.config/nvim/init.vim
nvim --headless +PlugInstall +qall
nvim --headless +TSUpdate +qall
echo && echo "✅ Nvim configuration file copied."
