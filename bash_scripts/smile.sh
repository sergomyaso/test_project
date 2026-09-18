#!/usr/bin/env bash

delay=0.12

clear
trap 'printf "\033[?25h"; exit' INT TERM EXIT

# Скрываем курсор
printf '\033[?25l'

while true; do
    clear
    cat <<'EOF'

        .-""""-.
       /        \
      |  O    O  |
      |    __    |
       \  ----  /
        '------'

        _____________
EOF
    sleep "$delay"

    clear
    cat <<'EOF'


        .-""""-.
       /        \
      |  O    O  |
      |    __    |
       \  ----  /
        '------'
        _____________
EOF
    sleep "$delay"

    clear
    cat <<'EOF'



          _____
       .-'     '-.
      /   X   X   \
     |     ___     |
      \___________/
    =================
EOF
    sleep 0.08

    clear
    cat <<'EOF'


           BOOM!

          _____
       .-'     '-.
      /   X   X   \
     |     ___     |
      \___________/
    =================
EOF
    sleep 0.15
done
