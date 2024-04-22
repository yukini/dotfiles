#!/bin/zsh

cd $(dirname ${0})

ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.zshenv ~/.zshenv
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.bash_profile ~/.bash_profile
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.gvimrc ~/.gvimrc
ln -s $(pwd)/.ideavimrc ~/.ideavimrc
ln -s $(pwd)/.spacemacs ~/.spacemacs
ln -s $(pwd)/.tern-config ~/.tern-config

mkdir -p ~/.config
ln -s $(pwd)/nvim/ ~/.config/nvim
ln -s $(pwd)/tmux/ ~/.config/tmux
ln -s $(pwd)/wezterm/ ~/.config/wezterm
ln -s $(pwd)/alacritty/ ~/.config/alacritty
ln -s $(pwd)/zellij/ ~/.config/zellij
