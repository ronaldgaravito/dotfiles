# Respaldo del QML de Caelestia

`caelestia-qml-<fecha>.tar.gz` — copia completa de
`/etc/xdg/quickshell/caelestia` **sin** `assets/` (esos los pone el paquete).

Sirve para deshacer cualquier parche manual al código del shell
(barras, paneles, interacción con el ratón, etc.).

## Restaurar

```bash
cd /home/ronald/dotfiles/backups
tar -xzf caelestia-qml-<fecha>.tar.gz -C /tmp
sudo cp -r /tmp/caelestia/. /etc/xdg/quickshell/caelestia/
caelestia shell -k && caelestia shell -d
```

Restauración alternativa (todo el paquete limpio):

```bash
sudo pacman -Qk caelestia-shell      # verificar integridad
yay -S caelestia-shell --overwrite '/etc/xdg/quickshell/caelestia/*'
```

## Notas

- Los archivos viven en `/etc`, así que son "config" para pacman y **no se
  pisan solos** al actualizar: si los modificas, el update deja tu versión o
  instala un `.pacnew`. Revisa eso después de cada `caelestia-shell` update.
- `shell.json` del usuario está en `.config/caelestia/shell.json` (versionado
  aparte, no se toca con esto).
