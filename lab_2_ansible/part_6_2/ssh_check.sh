#!/bin/bash

config_file="/etc/ssh/ssh_config"
dangerous_directives=("PermitRootLogin" "PasswordAuthentication" "Protocol"
                     "AllowUsers" "AllowGroups" "DenyUsers" "DenyGroups"
                     "PermitEmptyPasswords" "UsePAM" "X11Forwarding")

# Проверка наличия файла конфигурации SSH
if [ ! -f "$config_file" ]; then
    echo "Файл $config_file не найден."
    exit 1
fi

# Проверка каждой строки файла на наличие опасных директив
while IFS= read -r line; do
    # Игнорируем комментарии и пустые строки
    if [[ "$line" =~ ^\s*# ]] || [[ -z "$line" ]]; then
        continue
    fi
    
    # Проверяем наличие опасных директив в строке
    for directive in "${dangerous_directives[@]}"; do
        if [[ "$line" == *"$directive"* ]]; then
            echo "Найдена опасная директива в файле $config_file:"
            echo "$line"
        fi
    done
done < "$config_file"

echo "Анализ завершен."
