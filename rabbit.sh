#!/bin/bash

tput civis
clear

while true; do
    clear
    echo " (\\(\\ "
    echo " (-.-)"
    echo " (  ) (  )"
    echo "          "
    echo "=========="
    sleep 0.2

    clear
    echo "          "
    echo " (\\(\\ "
    echo " (=.=)"
    echo "  (__)(__)"
    echo "=========="
    sleep 0.2
done

trap 'tput cnorm; clear; exit' INT
