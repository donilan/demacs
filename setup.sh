#!/usr/bin/env bash

# backup old config
mv ~/.emacs ~/.emacs.bak
mv ~/.emacs.d ~/.emacs.d.bak

# clone branch
git clone https://github.com/donilan/demacs.git ~/.emacs.d

# make link
ln -s -f .emacs.d/emacs ~/.emacs

# build update script
echo "alias demacs-update='( cd ~/.emacs.d && git pull origin master )'" >> ~/.bashrc
