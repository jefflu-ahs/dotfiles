#!/usr/bin/env bash
set -e

echo "Applying dotfiles..."

ln -sf ~/dotfiles/.zshrc ~/.zshrc

echo "Done."
``