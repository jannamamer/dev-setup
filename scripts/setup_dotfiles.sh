#!/usr/bin/env bash
set -eu

echo "Setting up Zsh config..."
mkdir -p ~/.zshrc.d && cp -r ./dotfiles/.zshrc.d/* ~/.zshrc.d/
cp ./dotfiles/.zshrc ~/.zshrc
echo "✅ Zsh config deployed."

echo "Setting up Vim config..."
if [ -d ~/.vim/autoload/plug.vim ]; then
    echo "✅ vim-plug is already installed."
else
    echo "Downloading vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

mkdir -p ~/.vim/ftplugin && cp -r ./dotfiles/.vim/ftplugin/* ~/.vim/ftplugin/
cp ./dotfiles/.vimrc ~/.vimrc

vim +PlugInstall +qall

echo "✅ Vim config deployed."
