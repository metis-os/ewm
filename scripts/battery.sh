#!/bin/sh

#Copyright PwnWriter 2022 - present || METIS Linux < metislinux.org >

path='/sys/class/power_supply/'
icon_dir="$HOME/.config/ewm/icons"

# Loop through all entries in the directory
for entry in "$path"*
do
  # Check if the entry is a directory
  if [ -d "$entry" ]
  then
    full_path="${entry}/capacity"
    # Check if the capacity file exists
    if [ -f "$full_path" ]
    then
      # Read the percentage value from the file
      perc=$(cat "$full_path")

      # Check if the power supply is charging or discharging
      status=$(cat "${entry}/status")
      if [ "$status" = "Charging" ]
      then
        icon="$icon_dir/battery-charging.png"
        status_msg="charging"
      else
        # Determine the appropriate battery icon based on the percentage
        if [ "$perc" -gt 75 ]
        then
          icon="$icon_dir/battery-full.png"
        elif [ "$perc" -gt 25 ]
        then
          icon="$icon_dir/battery.png"
        else
          icon="$icon_dir/battery-low.png"
        fi
        status_msg="discharging"
      fi

      # Send a notification with the percentage value and the charging/discharging status
      notify-send -i "$icon" "Battery" "${status_msg}, ${perc}%"
    fi
  fi
done

