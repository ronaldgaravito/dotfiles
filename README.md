# Ronald's Dotfiles

My Hyprland (CachyOS) configuration.

## Components

- **Compositor**: Hyprland + Caelestia Shell
- **Terminal**: Kitty
- **Shell**: Fish
- **Launcher**: Rofi
- **Notifications**: Caelestia Shell (dunst backup)
- **Bar**: Caelestia Shell (waybar backup)

## Install

```bash
git clone https://github.com/ronald/dotfiles.git ~/dotfiles
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
├── caelestia/      # Caelestia shell config
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
