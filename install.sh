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

# Noctalia keeps its config in ~/.local/state, not ~/.config, so install.sh
# would not pick it up. Restore it if missing.
echo "Restoring noctalia settings..."
NOCTALIA_SRC="$DOTFILES_DIR/.config/noctalia/settings.toml"
NOCTALIA_DST="$HOME/.local/state/noctalia/settings.toml"
if [ -f "$NOCTALIA_SRC" ] && [ ! -f "$NOCTALIA_DST" ]; then
    mkdir -p "$(dirname "$NOCTALIA_DST")"
    cp "$NOCTALIA_SRC" "$NOCTALIA_DST"
    echo "  + .local/state/noctalia/settings.toml"
fi

echo ""
echo "Done! Reload Hyprland with: hyprctl reload"
