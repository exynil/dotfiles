#!/bin/bash

PID=$(pidof wf-recorder)

if [ -n "$PID" ]; then
    # Берем только первый PID, если их несколько
    PID=${PID%% *}

    # Время записи в секундах
    ELAPSED_TIME=$(ps -p "$PID" -o etime | sed -n '2p' | tr -d ' ')

    # Мигание иконки каждую секунду
    SECONDS=$(date +%s)
    if (( SECONDS % 2 == 0 )); then
        ICON=""
    else
        ICON=""
    fi

    TEXT_COLOR="#F8FAFC"

    # Сформированные части
    ICON_SPAN="<span foreground='#EF4444'>$ICON</span>"
    TEXT_SPAN="<span foreground='$TEXT_COLOR'>$ELAPSED_TIME</span>"

    # Основной текст, который будет показан в панели
    TEXT="$ICON_SPAN $TEXT_SPAN"

    echo "{\"text\": \"$TEXT\"}"
else
    echo "{}"
fi

