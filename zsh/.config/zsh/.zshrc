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

source $ZDOTDIR/aliases

# Обертка для Yazi, которая меняет директорию в shell после выхода
function rr() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

set-en-layout

# # The next line updates PATH for CLI.
# if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then source "$HOME/yandex-cloud/path.bash.inc"; fi

# # The next line enables shell command completion for yc.
# if [ -f "$HOME/yandex-cloud/completion.zsh.inc" ]; then source "$HOME/yandex-cloud/completion.zsh.inc"; fi