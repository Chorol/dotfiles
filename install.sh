#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# clangformat
ln -sv ${BASEDIR}/.clang-format ~/.clang-format

# vim
ln -sv ${BASEDIR}/.vimrc ~/.vimrc

# zsh
ln -sv ${BASEDIR}/.zshrc ~/.zshrc

# git
ln -sv ${BASEDIR}/.gitconfig ~/.gitconfig

# dircolors
ln -sv ${BASEDIR}/.dircolors ~/.dircolors

# i3 config files
ln -sv ${BASEDIR}/i3 ~/.config/i3

# neovim config files
ln -sv ${BASEDIR/init.vim ~/.config/nvim/init.vim

