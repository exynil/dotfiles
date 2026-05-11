require("colors")
require("config.autostart")
require("config.binds")
require("config.env")
require("config.permissions")
require("config.look")
require("config.misc")
require("config.input")
require("config.rules")



local hostname = os.getenv("HOSTNAME")

hl.monitor({ output = "", mode = "highres", position = "auto", scale = 1 })

if hostname == "arch-desktop" then
  hl.monitor({ output = "HDMI-A-1", disabled = true })

  for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
  end
  for i = 6, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2" })
  end

elseif hostname == "arch-laptop" then
  for i = 1, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
  end
end