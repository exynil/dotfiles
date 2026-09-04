ZSH=/usr/share/oh-my-zsh

ZSH_THEME="candy"

DISABLE_AUTO_UPDATE="true"

ZSH_CUSTOM=/usr/share/zsh

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
mkdir -p $ZSH_CACHE_DIR

HISTFILE=~/.cache/zsh.history

# Изолируем историю команд между сессиями терминала
unsetopt share_history
unsetopt inc_append_history

source $ZSH/oh-my-zsh.sh

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

if [[ "$TERM" == "xterm-kitty" ]]; then
    set-en-layout
fi