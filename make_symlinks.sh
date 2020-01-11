#!/bin/bash

CONFIG=`pwd`

mkdir -p ~/.config/i3 ~/.mplayer ~/.mutt

ln -s $CONFIG/.bashrc ~/.bashrc
ln -s $CONFIG/.gitconfig ~/.gitconfig
ln -s $CONFIG/.vimrc ~/.vimrc
ln -s $CONFIG/.config/git-prompt.sh ~/.config/git-prompt.sh
ln -s $CONFIG/.config/i3/config ~/.config/i3/config
ln -s $CONFIG/.config/i3/fehbg.sh ~/.config/i3/fehbg.sh
ln -s $CONFIG/.config/i3/i3exit.sh ~/.config/i3/i3exit.sh
ln -s $CONFIG/.config/i3/i3status.conf ~/.config/i3/i3status.conf
ln -s $CONFIG/.mplayer/input.conf ~/.mplayer/input.conf
find .bin -type f -exec ln -s $CONFIG/{} ~/.bin/ \;
cp $CONFIG/.mutt/* ~/.mutt/
