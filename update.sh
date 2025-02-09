#!/bin/bash

cp -r ~/.config/alacritty/ ~/.config/i3 ~/.config/nvim ~/.config/rofi  ~/.config/picom.conf ~/.config/lf ./
cp ~/.config/tmux/tmux.conf ./tmux/
cd ~/.dotfiles/nvim/
rm -rf .git .gitignore .github
