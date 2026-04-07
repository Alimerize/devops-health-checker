#!/bin/bash

echo "Начинаю настройку прав доступа для Health Checker..."

# 1. Создание лог-файла (если его нет)
LOG_PATH="/var/log/health_checker.log"
if [ ! -f "$LOG_PATH" ]; then
    sudo touch $LOG_PATH
    echo "Файл лога создан."
fi

# 2. Настройка владельца (Тема: chown)
# Мы отдаем файл текущему пользователю, чтобы скрипт мог в него писать
sudo chown $USER:$USER $LOG_PATH
echo "Права владельца на лог-файл переданы пользователю $USER."

# 3. Настройка прав на запуск скрипта (Тема: chmod)
chmod +x checker.py
echo "Скрипт checker.py теперь исполняемый (755)."

echo "Настройка завершена успешно!"
