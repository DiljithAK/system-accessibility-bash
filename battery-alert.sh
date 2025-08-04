#!/bin/env bash
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)

logfile="/home/diljith/battery-alert.log"

# Get battery percentage
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

echo "$(date): Battery level = $battery_level%" >> "$logfile"

if [ "$battery_level" -lt 30 ]; then
	notify-send --icon=battery-caution "Low Battery" "Battery is at ${battery_level}%! Please plug in the charger." -u critical
else
	echo "$(date): Battery OK. No alert." >> "$logfile"
fi
