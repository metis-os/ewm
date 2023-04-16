#!/bin/sh

#Copyright PwnWriter 2022 - present || METIS Linux < metislinux.org >

# Set the path to the directory containing the icons
icons_dir=~/.config/ewm/icons

# Get the current volume level
volume=$(pactl list sinks | awk '/Volume:/ { print $5 }' | head -n 1 | tr -d '%')

# Check if the volume is muted
muted=$(pactl list sinks | awk '/Mute:/ { print $2 }' | head -n 1)
if [ "$muted" = "yes" ]; then
    # Send a notification with the mute icon and message
    notify-send -i "$icons_dir/volume-mute.png" "Volume: Muted"
else
    # Determine which icon to use and message to display based on the volume level
    if [ "$volume" -gt "70" ]; then
        icon="$icons_dir/volume-full.png"
        message="Volume: Full ($volume%)"
    elif [ "$volume" -gt "0" ]; then
        icon="$icons_dir/volume-normal.png"
        message="Volume: Normal ($volume%)"
    else
        icon="$icons_dir/volume-mute.png"
        message="Volume: Muted ($volume%)"
    fi

    # Send a notification with the appropriate icon and message
    notify-send -i "$icon" "$message"
fi

