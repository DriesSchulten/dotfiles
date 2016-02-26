#!/bin/bash
sudo apt-get install zsh
chsh -s /bin/zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
