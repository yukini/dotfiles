#!/bin/zsh

mkdir -p ~/.config/nvim
mkdir -p ~/.config/tmux

cd $(dirname ${0})

ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.zshenv ~/.zshenv
ln -sf $(pwd)/.bashrc ~/.bashrc
ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.gvimrc ~/.gvimrc
ln -sf $(pwd)/.ideavimrc ~/.ideavimrc
ln -sf $(pwd)/.spacemacs ~/.spacemacs
ln -sf $(pwd)/.tern-config ~/.tern-config
ln -sf $(pwd)/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json

# neovim
if hash nvim; then
  ln -sf $(pwd)/.vimrc ~/.config/nvim/init.vim
fi
