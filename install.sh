#!/bin/bash

# Dotfiles installer
# Usage: bash install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Create directories
mkdir -p ~/.config
mkdir -p ~/.local/bin

# Copy configs
echo "Copying configs..."
cp -rv "$DOTFILES_DIR"/.config/* ~/.config/

# Copy scripts
echo "Copying scripts..."
cp -rv "$DOTFILES_DIR"/.local/bin/* ~/.local/bin/

# Make scripts executable
chmod +x ~/.local/bin/*

echo ""
echo "Done! Reload Hyprland with: hyprctl reload"
echo "Or press Super+R"
