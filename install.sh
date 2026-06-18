#!/usr/bin/env bash
set -e

echo "Installing dependencies..."

# ------------------------
# Fix broken Yarn repo (Codespaces bug)
# ------------------------
sudo rm -f /etc/apt/sources.list.d/yarn.list 2>/dev/null || true
sudo rm -f /etc/apt/sources.list.d/yarn.list.save 2>/dev/null || true
sudo sed -i '/dl.yarnpkg.com/d' /etc/apt/sources.list 2>/dev/null || true

# ------------------------
# Apt (safe)
# ------------------------
sudo apt-get update || echo "apt update failed, continuing..."
sudo apt-get install -y curl git fzf || true

# Ensure PATH
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

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

[ -d ~/.zsh/zsh-autosuggestions ] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

[ -d ~/.zsh/zsh-syntax-highlighting ] || \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# ------------------------
# Zoxide
# ------------------------
if ! command -v zoxide >/dev/null; then
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# ------------------------
# Link configs
# ------------------------
ln -sf ~/dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.config
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml 2>/dev/null || true

echo "✅ Dotfiles setup complete"
