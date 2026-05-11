-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "48")
hl.env("QT_SCALE_FACTOR", "1.4")
hl.env("GDK_SCALE", "1.5")
hl.env("GDK_DPI_SCALE", "1")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("GTK_THEME", "Materia-dark")

-- Добавил это после очередных экспериметов с Nvidia из документации
-- https://wiki.hypr.land/Nvidia/#environment-variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_ENABLE_HIGHDPI_SCALING", "1")
hl.env("QT_SCALE_FACTOR", "1")