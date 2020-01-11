#!/bin/bash

CONFIG=`pwd`

mkdir -p ~/.config/i3 ~/.mplayer ~/.mutt

ln -s $CONFIG/.bashrc ~/.bashrc
ln -s $CONFIG/.gitconfig ~/.gitconfig
ln -s $CONFIG/.vimrc ~/.vimrc
ln -s $CONFIG/.mplayer/input.conf ~/.mplayer/input.conf

find .config -type d -exec mkdir -p ~/{} \;
find .config -type f -exec ln -s $CONFIG/{} ~/{} \;
find .bin -type f -exec ln -s $CONFIG/{} ~/.bin/ \;
cp $CONFIG/.mutt/* ~/.mutt/
