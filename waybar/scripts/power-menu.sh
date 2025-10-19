#!/bin/bash

chosen=$(echo -e "⏻ Shutdown\n Reboot\n Sleep\n Lock\n󰜉 Logout" | wofi -dmenu -p "Power Menu")

case "$chosen" in
  "⏻ Shutdown") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  " Sleep") systemctl suspend ;;
  " Lock") hyprlock ;; # or swaylock / gtklock
  "󰜉 Logout") hyprctl dispatch exit ;;
esac
