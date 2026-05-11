-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local hostname = os.getenv("HOSTNAME")

hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar-run")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hyprsunset")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("QT_SCALE_FACTOR=1 telegram-desktop")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("udiskie -t")
  hl.exec_cmd("wl-paste --watch clipbox --store")
  hl.exec_cmd("wl-clip-persist --clipboard regular")
  hl.exec_cmd("dunst")
  hl.exec_cmd("fix-a2dp")
  hl.exec_cmd("git-pull-all")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface text-scaling-factor 1.5")

  if hostname == "arch-laptop" then
    hl.exec_cmd("battery-log")
    hl.exec_cmd("kbd-auto-backlight")
  end

  if hostname == "arch-desktop" then
    hl.exec_cmd("gsettings set org.gnome.desktop.interface text-scaling-factor 1.5")
  end
end)