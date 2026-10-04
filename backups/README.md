# Backups

Respaldo de configs anteriores a la migración Caelestia → Noctalia.
**No son archivos en uso**, solo para rollback.

## `pre-noctalia-20261003-201601/`

Estado de los archivos justo antes de migrar a Noctalia.
Para volver a Caelestia:

```bash
cp backups/pre-noctalia-20261003-201601/hypr/hyprland.conf  ~/.config/hypr/
cp backups/pre-noctalia-20261003-201601/kitty/kitty.conf    ~/.config/kitty/
cp backups/pre-noctalia-20261003-201601/local-bin/*         ~/.local/bin/
hyprctl reload
```

Además hay que:

1. Quitar `noctalia -d` del `exec-once` en `hyprland.conf` y
   descomentar la línea de Caelestia.
2. Caelestia sigue instalado (`caelestia` en AUR), así que basta con
   lanzarlo: `caelestia shell`.

## `fastfetch-20261003-201324/`

Copia de `config.jsonc` y de las 7 imágenes PNG que usa.

## `sync-border.caelestia.bak`

Versión de `~/.local/bin/sync-border` que leía el `scheme.json` de
Caelestia. La versión actual genera la paleta con `noctalia theme`.