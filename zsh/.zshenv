#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CURRENT_DESKTOP="gnome"

export HDD="/media/hdd"
export APP_DATA="$HDD/arch/app-data"

export TERMINAL=$(which xterm)
export BROWSER=$(which firefox)
export EDITOR=$(which vim)

export TERM="xterm-256color"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export VIMINIT="source ~/.config/vim/vimrc"
export PASSWORD_STORE_DIR="$APP_DATA/pass"

export LESSHISTFILE=-
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline


[[ "$PATH" == *"$HOME/.local/bin"* ]] || PATH="$HOME/.local/bin:$PATH"
