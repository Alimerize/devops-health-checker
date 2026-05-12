#!/bin/bash

echo "Начинаю настройку прав доступа для Health Checker..."

LOG_PATH="/var/log/health_checker.log"
if [ ! -f "$LOG_PATH" ]; then
    sudo touch $LOG_PATH
    echo "Файл лога создан."
fi

sudo chown $USER:$USER $LOG_PATH
echo "Права владельца на лог-файл переданы пользователю $USER."

chmod +x checker.py
echo "Скрипт checker.py теперь исполняемый (755)."

echo "Настройка завершена успешно!"
