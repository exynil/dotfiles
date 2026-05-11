-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
local closeWindowBind = hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(super .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind("ALT + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + T", hl.dsp.window.pseudo())
hl.bind("ALT + R", hl.dsp.layout("togglesplit"))

-- Move focus with super + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Move focus with super + HJKL
hl.bind("SUPER + h",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j",  hl.dsp.focus({ direction = "down" }))

-- Swap windows with super + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))

-- Swap windows with super + SHIFT + HJKL
hl.bind("SUPER + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))

-- Switch workspaces with super + [0-9]
-- Move active window to a workspace with super + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with super + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with super + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Rofi
hl.bind("SUPER + c", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/clipboard"))
hl.bind("SUPER + x", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/powermenu"))
hl.bind("SUPER + d", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/run"))
hl.bind("SUPER + w", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/waybar-switcher"))
hl.bind("SUPER + e", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/wallpaper"))
hl.bind("SUPER + q", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/calculator"))
hl.bind("SUPER + slash", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/commands"))
hl.bind("SUPER + a", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/open-folder"))
hl.bind("SUPER + r", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/record"))
hl.bind("SUPER + z", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/menu"))
hl.bind("SUPER + m", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/sshfs"))
hl.bind("SUPER + i", hl.dsp.exec_cmd("$XDG_CONFIG_HOME/rofi/scripts/2fa"))

-- Other
hl.bind("Print", hl.dsp.exec_cmd("QT_SCALE_FACTOR=1 flameshot gui"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim ~/Pictures/$(date +'%Y-%m-%d_%H-%M-%S_grim.png')"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("grim ~/Pictures/$(date +'%Y-%m-%d_%H-%M-%S_grim.png')"))
hl.bind("CTRL + grave", hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind("SUPER + g", hl.dsp.exec_cmd("translate"))
hl.bind("SUPER + SHIFT + i", hl.dsp.exec_cmd("waybar-run"))
hl.bind("SUPER + n", hl.dsp.exec_cmd("xpad -s"))


-- Resize window
hl.bind("SUPER + r", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
  hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
  hl.bind("up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
  hl.bind("down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

  hl.bind("l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

  -- Смена фокуса через SUPER + hjkl / стрелки
  hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
  hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))
  hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
  hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))

  hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
  hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
  hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
  hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))

  hl.bind("escape", hl.dsp.submap("reset"))
  hl.bind("return", hl.dsp.submap("reset"))
end)

hl.bind("SUPER + SHIFT + code:201", hl.dsp.exec_cmd("notify-send 'Copilot Key Pressed'"), { repeating = true })