#!/bin/bash

# Handle click event to open notification center
if [ "$1" = "click" ]; then
    osascript -e 'tell application "System Events" to keystroke "n" using {command down, shift down}' 2>/dev/null
    exit 0
fi

# Show time only (date is shown in separate calendar item)
sketchybar --set $NAME label="$(date +'%I:%M %p')"