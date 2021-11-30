#!/bin/bash

# все файлы в подпапках
mapfile -t files < <(find ./*/ -type f)

for file in "${files[@]#*/}"; do
    # создание папок в домашнем каталоге
    mkdir -p "$HOME/$(dirname "${file#*/}")"

    # создание ссылки с перезаписью существующего файла
    ln -sf "$PWD/$file" "$HOME/${file#*/}"
done
