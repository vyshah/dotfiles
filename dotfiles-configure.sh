#!/bin/bash

dir=~/dotfiles
origdir=~/.dotfiles_original
files=".vimrc .vim .bashrc .zshrc .oh-my-zsh"

echo -e "Creating $origdir for existing dotfiles ..."
mkdir -p $origdir

echo -e "Moving to $dir ..."
cd $dir

for file in $files; do
    echo -e "Moving $file to $origdir ..."
    mv ~/$file $origdir/
    echo -e "Creating symlink to $file in ~ ..."
    ln -s $dir/$file ~/$file
done
echo -e "Done."

