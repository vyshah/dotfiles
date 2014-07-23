#!/bin/bash

dir=~/dotfiles
origdir=~/.dotfiles_original
files=".vimrc .vim .bashrc .zshrc .oh-my-zsh"

for file in $files; do
    echo -e "Deleting $file symlink from ~ ..."
    rm ~/$file
    echo -e "Replacing original $file file to ~ ..."
    mv $origdir/$file ~
done

echo -e "Deleting $origdir directory ..."
rm -rf $origdir
echo -e "Done."
