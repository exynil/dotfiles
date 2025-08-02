#!/usr/bin/env bash

# Что делает этот скрипт:
# - Расшифровывает диск в /dev/mapper/decrypted_disk
# - Монтирует в /mnt/decrypted_disk
# - Синхронизирует /media/hdd в /mnt/decrypted_disk/hdd

# sudo umount /mnt/decrypted_disk - размонтировать
# sudo cryptsetup close decrypted_disk - заблокировать

if [ "$(id -u)" != "0" ]; then
    exec sudo "$0" "$@"  # Перезапуск скрипта с помощью sudo
    exit $?  # Выход с кодом возврата после выполнения команды sudo
fi

lsblk

printf '%*s\n' "$(tput cols)" '' | tr ' ' '-'

# Получение списка дисков
DISKS=($(lsblk -dn -o NAME,TYPE | grep disk | awk '{print "/dev/"$1}'))

if [[ ${#DISKS[@]} -eq 0 ]]; then
  echo "Нет доступных дисков для расшифровки."
  exit 1
fi

# Флаг успешного выполнения операций
SUCCESS=false

# Вывод списка дисков для выбора
echo "Выберите диск для расшифровки:"
select DISK in "${DISKS[@]}" "Выход"; do
  if [[ "$REPLY" -eq $(( ${#DISKS[@]} + 1 )) ]]; then
    echo "Выход."
    exit 0
  elif [[ -n "$DISK" ]]; then
    echo "Вы выбрали: $DISK"

    # Проверка существования криптоконтейнера
    if cryptsetup isLuks "$DISK"; then
      echo "Диск $DISK зашифрован."

      # Статическое имя для маппинга
      MAPPING_NAME="decrypted_disk"

      # Расшифровка
      if cryptsetup open "$DISK" "$MAPPING_NAME"; then
        echo "Диск успешно расшифрован и доступен как /dev/mapper/$MAPPING_NAME"

        # Монтирование
        MOUNT_POINT="/mnt/decrypted_disk"
        mkdir -p "$MOUNT_POINT"
        if mount "/dev/mapper/$MAPPING_NAME" "$MOUNT_POINT"; then
          echo "Диск смонтирован в $MOUNT_POINT"
          SUCCESS=true
        else
          echo "Ошибка при монтировании диска /dev/mapper/$MAPPING_NAME в $MOUNT_POINT."
        fi
      else
        echo "Ошибка при расшифровке диска $DISK."
      fi
    else
      echo "Диск $DISK не является зашифрованным."
    fi
    break
  else
    echo "Неверный выбор, попробуйте снова."
  fi
done

printf '%*s\n' "$(tput cols)" '' | tr ' ' '-'

if [[ "$SUCCESS" == true ]]; then
  echo "Все операции выполнены успешно."
  read -p "Запустить синхронизацию? (y/n): " CONFIRM
  if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
    rsync -av --delete --delete-excluded --progress \
    --exclude '*/node_modules' \
    --exclude '*/venv' \
    --exclude '*/.venv' \
    --exclude '*/.pytest_cache' \
    --exclude '*/__pycache__' \
    --exclude '*/.ruff_cache' \
    --exclude '*/lost+found' \
    --exclude '*/logs' \
    --exclude '*/.Trash-1000' \
    --exclude '*.swp' \
    /media/hdd "$MOUNT_POINT"
  else
    echo "Синхронизация отменена пользователем."
  fi
else
  echo "Скрипт завершен без успешного выполнения всех операций."
fi
