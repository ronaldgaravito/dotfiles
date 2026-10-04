# Ronald's Dotfiles

My Hyprland (CachyOS) configuration.

## Components

- **Compositor**: Hyprland + Noctalia Shell
- **Terminal**: Kitty
- **Shell**: Fish
- **Launcher**: Rofi
- **Notifications**: Noctalia Shell (dunst backup)
- **Bar**: Noctalia Shell (waybar backup)

## Install

```bash
git clone https://github.com/ronaldgaravito/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Copy configs
cp -r .config/* ~/.config/
cp -r .local/bin/* ~/.local/bin/

# Reload Hyprland
hyprctl reload
```

## Structure

```
.config/
├── hypr/           # Hyprland config
├── noctalia/       # Noctalia shell config (shell actual)
├── caelestia/      # Caelestia shell config (fallback, ya no se usa)
├── kitty/          # Terminal config
├── fish/           # Fish shell config
├── rofi/           # Launcher config
├── dunst/          # Notification daemon config
├── waybar/         # Bar config (backup)
├── fastfetch/      # System info
└── btop/           # System monitor

.local/bin/         # Custom scripts
```

## Screenshots

Coming soon...
