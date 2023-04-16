#!/bin/sh

#Copyright PwnWriter 2022 - present || METIS Linux < metislinux.org >

# Set the path to the directory containing the icons
icons_dir=~/.config/ewm/icons

# Get the current brightness level
brightness=$(brillo -G | cut -d "." -f 1)

# Determine which icon to use based on the brightness level
if [ "$brightness" -eq "0" ]; then
    icon="$icons_dir/light-dimming-off.png"
    message="Brightness: Off"
elif [ "$brightness" -le "20" ]; then
    icon="$icons_dir/light-dimming-20.png"
    message="Brightness: 20%"
elif [ "$brightness" -le "30" ]; then
    icon="$icons_dir/light-dimming-30.png"
    message="Brightness: 30%"
elif [ "$brightness" -le "40" ]; then
    icon="$icons_dir/light-dimming-40.png"
    message="Brightness: 40%"
elif [ "$brightness" -le "60" ]; then
    icon="$icons_dir/light-dimming-60.png"
    message="Brightness: 60%"
elif [ "$brightness" -le "70" ]; then
    icon="$icons_dir/light-dimming-70.png"
    message="Brightness: 70%"
else
    icon="$icons_dir/light-dimming-90.png"
    message="Brightness: 90%=+"
fi

# Send a notification with the appropriate icon and message
notify-send -i "$icon" "$message"

