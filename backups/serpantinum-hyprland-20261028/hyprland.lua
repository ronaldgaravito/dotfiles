-- Hyprland 0.55+ Lua configuration.
-- The old hyprland.conf remains available as a backup/reference.

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1.25,
})

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = "rgba(89b4faee)",
            inactive_border = "rgba(313244aa)",
        },
        layout = "dwindle",
    },
    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 0.65,
        rounding = 0,
        blur = {
            enabled = true,
            size = 6,
            passes = 2,
        },
    },
    animations = { enabled = true },
    input = {
        kb_layout = "latam",
        follow_mouse = 1,
        sensitivity = 0,
    },
    dwindle = { preserve_split = true },
    xwayland = { force_zero_scaling = true },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("serpantinumd start")
    hl.exec_cmd("nm-applet &")
    hl.exec_cmd("wl-paste --watch clipbox --store &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("udiskie &")
    hl.exec_cmd("sync-border-watch &")
end)

local function run(key, command, options)
    local dispatcher = hl.dsp.exec_cmd(command)
    if options then
        hl.bind(key, dispatcher, options)
    else
        hl.bind(key, dispatcher)
    end
end

-- Serpantinum and application shortcuts
run("SUPER + SPACE", "serpantinum msg toggle launcher")
run("SUPER + RETURN", "kitty")
run("CTRL + SPACE", "rofi -show drun")
run("SUPER + SHIFT + S", "serpantinum screenshot --edit")
run("PRINT", "serpantinum screenshot")
run("SHIFT + PRINT", "serpantinum screenshot --edit")
run("SUPER + E", "dolphin")
run("SUPER + V", "rofi -i -modi 'clipboard:/usr/bin/clipbox' -show clipboard -kb-element-next '' -kb-custom-1 'Tab' -kb-custom-2 'Alt+1' -kb-custom-3 'Alt+2' -kb-custom-4 'Alt+3' -kb-custom-5 'Alt+4' -kb-custom-6 'Alt+5' -kb-custom-7 'Alt+d' -kb-mode-next '' -kb-custom-9 'Control+Tab'")
run("SUPER + F", "/home/ronald/.config/hypr/scripts/maximize90.sh")
run("SUPER + P", "/home/ronald/.local/bin/monitor-switch")
run("SUPER + M", "hyprctl dispatch exit")
run("SUPER + L", "serpantinum lock")
run("SUPER + N", "serpantinum msg toggle guide")
run("SUPER + W", "serpantinum msg toggle wallpaper")
run("SUPER + PERIOD", "rofi -show emoji")
run("SUPER + CTRL + N", "serpantinum msg clearNotifications")
run("SUPER + B", "serpantinum msg toggle system")

-- Window and workspace shortcuts
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("ALT + TAB", hl.dsp.window.cycle_next(), { repeating = true })
hl.bind("ALT + TAB", hl.dsp.window.bring_to_top(), { repeating = true })
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.focus({ workspace = "r-1" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("SUPER + CTRL + DOWN", hl.dsp.focus({ workspace = "empty" }))

for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media, volume and brightness
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
