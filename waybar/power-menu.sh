#!/bin/bash

# Get battery percentage
PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)

# Get TLP info
TLP_MODE=$(tlp-stat -s | grep "Power source" | awk -F': ' '{print $2}')
GOVERNOR=$(tlp-stat -c | grep "CPU_SCALING_GOVERNOR_ON_$TLP_MODE" | awk -F'=' '{print $2}')
TURBO=$(tlp-stat -c | grep "CPU_BOOST_ON_$TLP_MODE" | awk -F'=' '{print $2}')
if [ "$TURBO" == "1" ]; then TURBO_ICON="⚡"; else TURBO_ICON=""; fi

# Output for Waybar
# Minimal text for the bar
echo "$PERCENT%"

# Extra info for tooltip (Waybar reads it from 'tooltip-format' if you provide)
echo "{\"tooltip\": \"$TLP_MODE, $GOVERNOR $TURBO_ICON\"}"
