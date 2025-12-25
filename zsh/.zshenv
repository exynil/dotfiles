#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export HDD="/media/hdd"
export APP_DATA="$HDD/arch/app-data"
export DOTFILES="${$(dirname "$(realpath "$HOME/.zshenv")")%/*}"

export TERMINAL=$(which alacritty)
export BROWSER=$(which zen-browser)
export EDITOR=$(which vim)

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export VIMINIT="source ~/.config/vim/vimrc"
export PASSWORD_STORE_DIR="$APP_DATA/pass"
export TOTP_SECRETS_FILE="$APP_DATA/2fa/secrets"
export TERM=xterm-256color

# Настройка LESS
export LESSHISTFILE=-
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Для отображения секунд в телеге
export LC_TIME=C.UTF-8

export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0
export KWIN_DRM_USE_MODIFIERS=0
export _JAVA_AWT_WM_NONREPARENTING=1

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_SOUNDS_DIR="$HOME/Sounds"

# Для hyprland
export HOSTNAME="$HOST"

[[ "$PATH" == *"$HOME/.local/bin"* ]] || PATH="$HOME/.local/bin:$PATH"
