#!/bin/sh

#Copyright PwnWriter 2022 - present || METIS Linux < metislinux.org >

# This script displays the current date and time using notify-send

# Define variables
today=$(date +%Y-%m-%d\ %H:%M:%S)
config_dir=~/.config/ewm
icon=$config_dir/icons/cal.png

# Display notification
if ! notify-send "Today's date is" "$today" -i "$icon"; then
  echo "Error: Notification could not be displayed" >&2
  exit 1
fi

