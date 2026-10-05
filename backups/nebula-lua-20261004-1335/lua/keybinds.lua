-- Adaptación automática de tus keybinds (Hyprland)
-- Fuente: https://github.com/ronaldgaravito/dotfiles.git .config/hypr/keybindings.conf

local hl = require("hl")
local mainMod = "SUPER"
local SCRIPTS = os.getenv("HOME") .. "/.config/hypr/scripts"

-- Aplicaciones
local terminal = "kitty"
local editor = "code"
local filemanager = "dolphin"
local browser = "firefox"

-- Acciones de ventana/sesión
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a")) -- Picker de color
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(SCRIPTS .. "/dontkillsteam.sh")) -- Cerrar ventana enfocada
hl.bind("ALT + F4", hl.dsp.exec_cmd(SCRIPTS .. "/dontkillsteam.sh")) -- Cerrar ventana enfocada
hl.bind(mainMod .. " + DELETE", hl.dsp.exec_cmd("hyprctl dispatch exit")) -- Terminar sesión Hyprland
hl.bind(mainMod .. " + W", hl.dsp.window.float({action = "toggle"})) -- Cambiar entre flotar
hl.bind(mainMod .. " + G", hl.dsp.group.toggle()) -- Cambiar entre grupos de ventanas
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen()) -- Cambiar entre pantalla completa
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("blazinlock -hw")) -- Lanzar pantalla de bloqueo
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(SCRIPTS .. "/windowpin.sh")) -- Poner ventana en pin
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd(SCRIPTS .. "/logoutlaunch.sh")) -- Lanzar menú de cerrar sesión
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd("killall waybar || (env reload_flag=1 " .. SCRIPTS .. "/wbarconfgen.sh)")) -- Alternar waybar

-- Accesos directos de aplicaciones
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal)) -- Lanzar terminal
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager)) -- Lanzar gestor de archivos
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor)) -- Lanzar editor de texto
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser)) -- Lanzar navegador
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(SCRIPTS .. "/sysmonlaunch.sh")) -- Lanzar monitor del sistema

-- Menús de Rofi
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill -x rofi || " .. SCRIPTS .. "/rofilaunch.sh d")) -- Lanzar aplicación
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("pkill -x rofi || " .. SCRIPTS .. "/rofilaunch.sh w")) -- Lanzar conmutador de ventanas
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("pkill -x rofi || " .. SCRIPTS .. "/rofilaunch.sh f")) -- Lanzar explorador de archivos

-- Controles de audio y medios
hl.bind("F10", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o m")) -- Alternar muteo de audio
hl.bind("F11", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o d")) -- Disminuir volumen
hl.bind("F12", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o i")) -- Aumentar volumen
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o m")) -- Alternar muteo
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -i m")) -- Alternar muteo de micrófono
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o d")) -- Disminuir volumen
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(SCRIPTS .. "/volumecontrol.sh -o i")) -- Aumentar volumen
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause")) -- Control de reproducción
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause")) -- Control de pausa
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next")) -- Canción siguiente
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous")) -- Canción anterior

-- Controles de brillo
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(SCRIPTS .. "/brightnesscontrol.sh i")) -- Aumentar brillo
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(SCRIPTS .. "/brightnesscontrol.sh d")) -- Disminuir brillo

-- Navegación de grupos
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.change_group({direction = "b"})) -- Cambiar grupo a atrás
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.change_group({direction = "f"})) -- Cambiar grupo a adelante

-- Scripts personalizados
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(SCRIPTS .. "/gamemode.sh")) -- Desactivar efectos de Hypr para modo de juego
hl.bind(mainMod .. " + ALT + RIGHT", hl.dsp.exec_cmd(SCRIPTS .. "/swwwallpaper.sh -n")) -- Póster siguiente
hl.bind(mainMod .. " + ALT + LEFT", hl.dsp.exec_cmd(SCRIPTS .. "/swwwallpaper.sh -p")) -- Póster anterior
hl.bind(mainMod .. " + ALT + UP", hl.dsp.exec_cmd(SCRIPTS .. "/wbarconfgen.sh n")) -- Siguiente modo de barra
hl.bind(mainMod .. " + ALT + DOWN", hl.dsp.exec_cmd(SCRIPTS .. "/wbarconfgen.sh p")) -- Anterior modo de barra
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("pkill -x rofi || " .. SCRIPTS .. "/wallbashtoggle.sh -m")) -- Lanzar toggler de wallbase
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("pkill -x rofi || " .. SCRIPTS .. "/themeselect.sh")) -- Lanzar selector de temas

