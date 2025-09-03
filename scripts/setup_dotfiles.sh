#!/usr/bin/env bash
set -eu

echo "Setting up Zsh config..."
mkdir -p ~/.zshrc.d && cp -r ./dotfiles/.zshrc.d/* ~/.zshrc.d/
cp ./dotfiles/.zshrc ~/.zshrc
echo "✅ Zsh config deployed."

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    echo "✅ Vundle is already installed."
else
    echo "Setting up Vim config..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

mkdir -p ~/.vim/ftplugin && cp -r ./dotfiles/.vim/ftplugin/* ~/.vim/ftplugin/
cp ./dotfiles/.vimrc ~/.vimrc

vim +PluginInstall +qall

if [ -d ~/.vim/bundle/command-t/lua/wincent/commandt/lib ]; then
  echo "Building Command-T native extension..."
  cd ~/.vim/bundle/command-t/lua/wincent/commandt/lib
  make
fi

echo "✅ Vim config deployed."