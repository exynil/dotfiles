#!/bin/bash

## Терминал
# super + Return
xkb-switch -s us
$TERMINAL

## Перезагрузка dxhd
# super + Escape
pkill -USR1 -x dxhd

## Выход и перезагрузка bspwm
# super + alt + {q,r}
bspc {quit,wm -r}

## Закрытие окна
# super + shift + q
bspc node -c

## alternate between the tiled and monocle layout
# alt + m
bspc desktop -l next

##--------------------- state/flags ---------------------##

## set the window state
# alt + {t,shift + t,s,f}
bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

## set the node flags
# alt + ctrl + {m,x,y,z}
bspc node -g {marked,locked,sticky,private}

##--------------------- focus/swap ---------------------##

## focus the node in the given direction
# super + {_,shift + }{h,j,k,l}
bspc node -{f,s} {west,south,north,east}

# super + {_,shift + }{Left,Down,Up,Right}
bspc node -{f,s} {west,south,north,east}

## focus the node for the given path jump
# super + {p,b,comma,period}
bspc node -f @{parent,brother,first,second}

## focus the next/previous window in the current desktop
# super + {_,shift +} Tab
bspc node -f {next,prev}.local.!hidden.window

# super + {_,shift +} BackSpace
bspc node -f {next,prev}.local.!hidden.window

## focus or send to the given desktop
# super + {_,shift + } {1-9,0}
bspc {desktop -f,node -d} '{1-9,10}'

## focus or send to the given desktop
# super + {_,shift + } KP_{1-9,0}
bspc {desktop -f,node -d} '{1-9,10}'

##--------------------- Preselect ---------------------##

## preselect the direction
# super + ctrl + {h,j,k,l}
bspc node -p {west,south,north,east}

# super + ctrl + {Left,Down,Up,Right}
bspc node -p {west,south,north,east}

## cancel the preselection for the focused node
# super + ctrl + space
bspc node -p cancel

## cancel the preselection for the focused desktop
# super + ctrl + shift + space
bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

## --------------------- move/resize ---------------------##

## expand a window by moving one of its side outward
# super + alt + {h,j,k,l}
bspc node -z {left -120 0,bottom 0 120,top 0 -120,right 120 0}

# super + alt + {Left,Down,Up,Right}
bspc node -z {left -120 0,bottom 0 120,top 0 -120,right 120 0}

## contract a window by moving one of its side inward
# super + alt + shift + {h,j,k,l}
bspc node -z {right -120 0,top 0 120,bottom 0 -120,left 120 0}

# super + alt + shift + {Left,Down,Up,Right}
bspc node -z {right -120 0,top 0 120,bottom 0 -120,left 120 0}

## move a floating window
# super + {Left,Down,Up,Right}
bspc node -v {-80 0,0 80,0 -80,80 0}

## rotate
# alt + r
bspc node @parent -R 90

##--------------------- Rofi ---------------------##

# super + {d,w,x,m}
$XDG_CONFIG_HOME/rofi/scripts/{run,window,powermenu,display}

# super + {c,q,o}
$XDG_CONFIG_HOME/rofi/scripts/{clipboard,calculator,zoom}

# super + {v,r,e,a}
$XDG_CONFIG_HOME/rofi/scripts/{colorscheme,record,wallpaper,folder}

# super + {z,slash}
$XDG_CONFIG_HOME/rofi/scripts/{menu,command}

##--------------------- Screenshot ---------------------##

## gui
# Print
flameshot gui

## fullscreen
# super + Print
flameshot full -c

##--------------------- Backlight ---------------------##

# XF86MonBrightness{Up,Down}
xbacklight {-inc 10,-dec 10}

##--------------------- Audio ---------------------##

# XF86Audio{Play,Stop,Prev,Next}
playerctl {play-pause,stop,previous,next}

# XF86AudioMute
pamixer -t

# XF86Audio{RaiseVolume,LowerVolume}
pamixer {-i 2,-d 2}
dunstify -t 500 -h int:value:$(pamixer --get-volume) Volume

##--------------------- user setup ---------------------##

## Hide polybar
# super + i
polybar-toggle

## Termbin
# super + t
termbin

## Translate selection
# super + g
translate

## htop
#ctrl + alt + Delete
$TERMINAL -e htop -H

## dunst history
# ctrl + grave
dunstctl history-pop
