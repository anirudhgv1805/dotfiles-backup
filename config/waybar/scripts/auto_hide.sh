#!/bin/bash

STATE="$HOME/.cache/waybar-hidden"

mkdir -p "$(dirname "$STATE")"

echo 0 > "$STATE"

while true; do
    read -r x y <<< "$(hyprctl cursorpos | tr ',' ' ')"

    hidden=$(cat "$STATE")

    # Top-left corner -> show
    if [ "$x" -le 10 ] && [ "$y" -le 10 ] && [ "$hidden" -eq 1 ]; then
        pkill -SIGUSR1 waybar
        echo 0 > "$STATE"
        sleep 1
    fi

    # Move away -> hide
    if [ "$x" -gt 100 ] || [ "$y" -gt 100 ] && [ "$hidden" -eq 0 ]; then
        pkill -SIGUSR1 waybar
        echo 1 > "$STATE"
        sleep 1
    fi

    sleep 0.2
done