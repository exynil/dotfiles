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
rr() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# Делает и отправляет скриншоты экрана через send-file с указанным интервалом.
screenwatch() {
    local interval="${1:-60}"

    while true; do
        local file="/tmp/$(date +'%Y%m%d_%H%M%S.png')"

        spectacle -b -n -o "$file"

        send-file -f "$file" -t 9480

        rm -f "$file"

        sleep "$interval"
    done
}

# Делает скриншот экрана и отправляет его через send-file.
sendscreenshot() {
    local file="/tmp/$(date +'%Y%m%d_%H%M%S.png')"

    spectacle -b -n -o "$file" &&
    send-file -f "$file" -t 9536 &&
    rm -f "$file"
}


if [[ "$TERM" == "xterm-kitty" ]]; then
    set-en-layout
fi