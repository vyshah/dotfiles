#!/bin/bash

dir=~/dotfiles
origdir=~/.dotfiles_original
files=".vimrc .vim .bashrc .zshrc .oh-my-zsh .fonts"

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

echo -e "Mapping Caps Lock to Ctrl ..."
setxkbmap -option ctrl:nocaps

echo -e "Adding patched terminal font ..."
fc-cache -vf ~/.fonts

echo -e "Done."

