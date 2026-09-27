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

# Restore wallbash-generated files from defaults if they don't exist yet.
# (They are gitignored because wallbash rewrites them on every wallpaper change.)
echo "Restoring generated theme files..."
while IFS= read -r -d '' base; do
    rel="${base#"$DOTFILES_DIR"/defaults/}"
    target="$HOME/.$rel"
    if [ ! -f "$target" ]; then
        mkdir -p "$(dirname "$target")"
        cp "$base" "$target"
        echo "  + $rel"
    fi
done < <(find "$DOTFILES_DIR/defaults" -type f -print0)

echo ""
echo "Done! Reload Hyprland with: hyprctl reload"
