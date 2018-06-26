#!/bin/zsh

cd $(dirname ${0})

ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.zsh_profile ~/.zsh_profile
ln -sf $(pwd)/.bashrc ~/.bashrc
ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.vimrc ~/.vimrc
ln -sf $(pwd)/.gvimrc ~/.gvimrc
ln -sf $(pwd)/.ideavimrc ~/.ideavimrc
ln -sf $(pwd)/.spacemacs ~/.spacemacs
ln -sf $(pwd)/.tern-config ~/.tern-config

