#!/bin/bash

stow -d ${PWD} -t ${HOME} bash bin git i3 mplayer tmux vim vscode zathura rofipass

CONFIG=`pwd`

mkdir -p ~/.mutt
cp $CONFIG/mutt/.mutt/* ~/.mutt/
