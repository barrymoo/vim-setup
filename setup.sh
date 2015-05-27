#!/bin/bash

dir=~/.vim

echo "---> Moving current .vimrc to .vimrc.bak, and setting up new vimrc <---"
mv ~/.vimrc ~/.vimrc.bak
cd ~
ln -s $dir/vimrc .vimrc
cd $dir

# Get or Update Vundle
if [ -d $dir/bundle/vundle ]; then
    echo "--> Updating Vundle <--"
    cd $dir/bundle/vundle
    git pull
else
    echo "--> Cloning Vundle <--"
    git clone https://github.com/gmarik/vundle.git $dir/bundle/vundle
fi

# Get our packages
cd $dir
vim -s vundle.vim

# Get or Update CtrlP
echo "--> Dealing with CtrlP plugin <--"
if [ -d $dir/bundle/ctrlp.vim ]; then
    echo "--> Updating CtrlP <--"
    cd $dir/bundle/ctrlp.vim
    git pull
else
    echo "--> Cloning CtrlP <--"
    git clone https://github.com/kien/ctrlp.vim.git $dir/bundle/ctrlp.vim
fi

echo "---> All done, thanks $USER :) <---"
