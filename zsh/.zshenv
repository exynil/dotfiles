#!/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CURRENT_DESKTOP="gnome"

export TERMINAL=$(which alacritty)
export BROWSER=$(which firefox)
export EDITOR=$(which vim)

export _JAVA_AWT_WM_NONREPARENTING=1
export TERM=xterm-256color
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export VIMINIT="source ~/.config/vim/vimrc"
export LESSHISTFILE=-
export PASSWORD_STORE_DIR="/media/hdd/max/password-store"

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline


[[ "$PATH" == *"$HOME/.local/bin"* ]] || PATH="$HOME/.local/bin:$PATH"
