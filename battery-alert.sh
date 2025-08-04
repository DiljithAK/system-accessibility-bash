#!/bin/env bash

# Get battery percentage
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$battery_level" -lt 70 ]; then
	notify-send --icon=battery-caution "Low Battery" "Battery is at ${battery_level}%! Please plug in the charger." -u critical
fi
