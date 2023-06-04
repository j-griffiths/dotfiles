#!/bin/zsh

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc

