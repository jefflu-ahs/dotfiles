#!/usr/bin/env bash
set -e

echo "Installing dependencies..."

# Install packages
sudo apt-get update
sudo apt-get install -y curl git fzf

# ------------------------
# Starship
# ------------------------
if ! command -v starship >/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# ------------------------
# Zsh plugins
# ------------------------
mkdir -p ~/.zsh

# Autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    ~/.zsh/zsh-autosuggestions
fi

# Syntax highlighting
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ~/.zsh/zsh-syntax-highlighting
fi

# ------------------------
# Zoxide
# ------------------------
if ! command -v zoxide >/dev/null; then
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# ------------------------
# Link dotfiles config
# ------------------------
ln -sf ~/dotfiles/.zshrc ~/.zshrc


echo "Done installing dotfiles dependencies"
