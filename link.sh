#!/bin/zsh

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

ln -sf $(pwd)/nvim/ ~/.config/nvim
ln -sf $(pwd)/tmux/ ~/.config/tmux
ln -sf $(pwd)/wezterm/ ~/.config/wezterm
ln -sf $(pwd)/alacritty/ ~/.config/alacritty
ln -sf $(pwd)/zellij/ ~/.config/zellij
