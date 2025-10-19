#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT*/capacity)
icon=""
if [ "$capacity" -lt 15 ]; then
  icon=""
elif [ "$capacity" -lt 30 ]; then
  icon=""
elif [ "$capacity" -lt 50 ]; then
  icon=""
elif [ "$capacity" -lt 80 ]; then
  icon=""
fi

power_mode=$(powerprofilesctl get)

echo "{
  \"text\": \"<span size='20000'>$icon</span><span rise='3000'> $capacity%</span>\",
  \"tooltip\": \"$capacity%\nPower Mode: $power_mode\"
}"
