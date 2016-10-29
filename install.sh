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
