#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "$0")" || exit; pwd)

# ----------------------------------
# GENERAL
# ----------------------------------
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# ----------------------------------
# TMUX
# ----------------------------------
# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ----------------------------------
# ZSH
# ----------------------------------
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install zsh power line
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# ----------------------------------
# Install dotfiles / setting files
# ----------------------------------
# WSL
if [[ "$(uname -r)" == *microsoft* ]]; then
  ln -s "$SCRIPT_DIR/wsl/wsl.conf" "$HOME/wsl.conf"
fi

# All
ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
ln -s "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
