#!/bin/bash

pgrep -x dxhd >/dev/null || dxhd &
pgrep -x polybar >/dev/null || polybar-run &
pgrep -x xautolock >/dev/null || xautolock -time 10 -detectsleep -corners ---- -locker slock &
pgrep -x blueman-applet >/dev/null || blueman-applet &
pgrep -x nm-applet >/dev/null || nm-applet &
pgrep -x greenclip >/dev/null || greenclip daemon &
pgrep -x telegram >/dev/null || telegram-desktop &
pgrep -x udiskie >/dev/null || udiskie -t &
pgrep -x clipit >/dev/null || clipit &
pgrep -x picom >/dev/null || picom &


xrdb "$XDG_CONFIG_HOME"/xresources/xresources &
xset r rate 350 62 &
numlockx on &
libinput-gestures-setup start &
xsetroot -cursor_name left_ptr &
hsetroot -fill ~/Pictures/wallpaper.jpg &
# hsetroot -solid "#1e2127"
battery &

nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'