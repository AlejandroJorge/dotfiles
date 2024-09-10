#!/bin/bash

# Get the current volume level and mute status
# volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')
# mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
#
# # Check if the volume is muted
# if [ "$mute" = "yes" ]; then
#     echo "🔇"
# else
#     echo "🔊 $volume%"
# fi

echo "Hola"
