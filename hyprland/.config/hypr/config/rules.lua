-- Telegram
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "8 silent" })

-- Calculator
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })

-- Xpad
hl.window_rule({
  name = "xpad",
  match = { class = "xpad" },
  float = true,
  pin = true,
})

-- Float file dialogs
hl.window_rule({
  match = {
    title = "(Выбор файлов|Выберите файл|Действия над файлами"
         .. "|Открытие файлов|Выгрузка файла|Переименовать"
         .. "|Сохранить файл|Open Folder|Open File|Save As"
         .. "|Select Python interpreter|Select path to save file)"
  },
  float = true,
})

-- MPV
hl.window_rule({ match = { class = "mpv" }, float = true })

-- Picture-in-Picture
hl.window_rule({
  match = { title = "Картинка в картинке" },
  float = true,
  pin = true,
})

-- Flameshot pin
hl.window_rule({
  name = "flameshot-pin",
  match = { title = "flameshot-pin" },
  border_size = 0,
  no_blur = true,
  pin = true,
  float = true,
})

-- Flameshot multi-display fix
hl.window_rule({
  name = "flameshot-multi-display-fix",
  match = { class = "flameshot", title = "flameshot" },
  animation = "fade",
  rounding = 0,
  border_size = 0,
  fullscreen_state = "0 0",
  float = true,
  pin = true,
  monitor = "DP-1",
  move = {"0", "0"},
  size = {"monitor_w*2", "monitor_h"},
})

-- Rofi
hl.layer_rule({
  name = "rofi",
  match = { namespace = "rofi" },
  no_screen_share = true,
  dim_around = true,
})