#!/bin/bash

# Запрос адреса для пинга

    read -p "Введите адрес для пинга: " address

# Переменные

fail_count=0

max_failures=3

max_ping_time=100

while true; do

    # Выполнить пинг с таймаутом 1 секунду

    ping_result=$(ping -c 1 -W 1 $address 2>/dev/null)

    if [[ $? -ne 0 ]]; then

        # Если пинг не удался

        ((fail_count++))

        echo "Ошибка пинга. Количество неудачных попыток: $fail_count"

    else

        # Извлечь время пинга

        ping_time=$(echo "$ping_result" | grep -oP 'time=\K[0-9.]+')



        if (( $(echo "$ping_time > $max_ping_time" | bc -l) )); then

            echo "Время пинга $ping_time мс превышает лимит $max_ping_time мс."

        else

            # Если пинг успешный и время в пределах нормы

            echo "Пинг $address успешный: $ping_time мс."

        fi



        # Сбросить счетчик неудач

        fail_count=0

    fi



    # Проверить превышение лимита неудачных попыток

    if (( fail_count >= max_failures )); then

        echo "Пинг не удался $max_failures раз подряд. Проверьте соединение."

        exit 1

    fi



    # Задержка 1 секунда перед следующим пингом

    sleep 1

done