#!/usr/bin/env bash

# Очистка экрана и скрытие курсора
tput civis
clear

# Восстановление курсора при прерывании скрипта (Ctrl+C)
cleanup() {
    tput cnorm
    echo -e "\033[0m"
    clear
    exit 0
}
trap cleanup SIGINT SIGTERM

# Размеры терминала
cols=$(tput cols)
lines=$(tput lines)

# Смещение по X и угол для вычисления высоты Y
x=0
angle=0

while true; do
    # Обновление размеров при изменении окна
    cols=$(tput cols)
    lines=$(tput lines)

    # Вычисление высоты Y через awk (синусоида)
    y=$(awk -v a="$angle" -v max="$lines" 'BEGIN {
        rad = a * 3.14159 / 180;
        amplitude = int((max - 8) / 3);
        center = int(max / 2);
        val = int(center + amplitude * sin(rad));
        if (val < 2) val = 2;
        print val;
    }')

    # Очистка экрана и перемещение в верхний левый угол
    printf "\033[H\033[2J"

    # Отступ сверху
    for ((i = 0; i < y; i++)); do
        echo ""
    done

    # Чередование взмаха крыльев каждые несколько кадров
    pad=$(printf '%*s' "$x" '')
    frame=$(( (x / 2) % 2 ))

    if [ "$frame" -eq 0 ]; then
        # Крылья опущены
        printf "%s\033[1;37m        __      \033[0m\n" "$pad"
        printf "%s\033[1;37m  \\\\  (oo)      \033[0m\n" "$pad"
        printf "%s\033[1;37m   \\\\/ \\/ \\---\\ \033[0m\n" "$pad"
        printf "%s\033[1;37m      ||     *  \033[0m\n" "$pad"
        printf "%s\033[1;37m      ||---||   \033[0m\n" "$pad"
    else
        # Крылья подняты
        printf "%s\033[1;37m   //   __      \033[0m\n" "$pad"
        printf "%s\033[1;37m  //  (oo)      \033[0m\n" "$pad"
        printf "%s\033[1;37m     / \\/ \\---\\ \033[0m\n" "$pad"
        printf "%s\033[1;37m      ||     *  \033[0m\n" "$pad"
        printf "%s\033[1;37m      ||---||   \033[0m\n" "$pad"
    fi

    # Сдвиг по горизонтали и углу волны
    ((x++))
    angle=$(( (angle + 12) % 360 ))

    # Перезапуск с левого края при выходе за пределы экрана
    if [ "$x" -ge $((cols - 18)) ]; then
        x=0
    fi

    sleep 0.05
done