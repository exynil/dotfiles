
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

# Упаковать текущую директорию -> 7z -> GPG -> Telegram
pack-send() {
    local dir_name="${PWD:t}"
    local datetime="$(date +'%Y-%m-%d-%H-%M-%S')"
    local archive="${dir_name}-${datetime}.7z"
    local recipient="Maxim Kim"

    local tmp_dir="$(mktemp -d)" || return 1
    local archive_path="$tmp_dir/$archive"
    local encrypted_path="$archive_path.gpg"

    # Удаляем временную директорию при любом выходе из функции
    trap 'rm -rf "$tmp_dir"' EXIT INT TERM

    echo "📦 Архивирую: $PWD"

    7z a -t7z -mx=9 "$archive_path" . || return 1

    echo "🔐 Шифрую..."

    gpg \
        --output "$encrypted_path" \
        --encrypt \
        --recipient "$recipient" \
        "$archive_path" || return 1

    echo "📤 Отправляю в Telegram..."

    send-file -f "$encrypted_path" -t 734 || return 1

    echo "✅ Готово: $archive.gpg"
}


# Расшифровать .7z.gpg -> распаковать -> удалить временный 7z
unpack-gpg() {
    local encrypted="$1"

    if [[ -z "$encrypted" ]]; then
        echo "Использование: unpack-gpg <file.7z.gpg>"
        return 1
    fi

    [[ -f "$encrypted" ]] || {
        echo "❌ Файл не найден: $encrypted"
        return 1
    }

    local archive="${encrypted%.gpg}"
    local outdir="${archive%.7z}"

    echo "🔓 Расшифровываю..."

    gpg \
        --output "$archive" \
        --decrypt "$encrypted" || return 1

    mkdir -p "$outdir" || return 1

    echo "📂 Распаковываю в $outdir..."

    7z x "$archive" -o"$outdir" || {
        rm -f "$archive"
        return 1
    }

    rm -f "$archive"

    echo "✅ Готово"
}

# Синхронизирует текущую директорию между arch-desktop и arch-laptop.
# Текущий компьютер является источником. На другом компьютере директория
# создаётся при необходимости и приводится к точной копии локальной (--delete).
sync() {
    local current_host="$HOSTNAME"
    local target_host
    local sync_path="$PWD"

    case "$current_host" in
        arch-desktop)
            target_host="laptop"
            ;;
        arch-laptop)
            target_host="desktop"
            ;;
        *)
            echo "Неизвестный хост: $current_host"
            return 1
            ;;
    esac

    echo "Синхронизация:"
    echo

    # Проверяем, существует ли папка на другой машине
    if ssh "$target_host" "test -d ${(q)sync_path}"; then
        echo "ВНИМАНИЕ: папка уже существует на ${target_host}:"
        echo "${sync_path}"
        echo
        echo "Удалённая папка будет приведена в точное соответствие"
        echo "с локальной. Файлы, которых нет локально, будут удалены."
        echo

        read "answer?Продолжить? [y/N] "

        if [[ "$answer" != [yY] ]]; then
            echo "Синхронизация отменена."
            return 0
        fi

        echo
    else
        # Создаём директорию, если её нет
        echo "Папка не существует на ${target_host}. Создаю..."
        ssh "$target_host" "mkdir -p ${(q)sync_path}" || return 1
    fi

    echo "Начинаю синхронизацию..."
    echo

    rsync \
        -avh \
        --delete \
        --progress \
        "${sync_path}/" \
        "${target_host}:${sync_path}/"
}