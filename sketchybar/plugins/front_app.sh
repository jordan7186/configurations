#!/bin/sh

# Front app switched event handler
# Shows the current application name

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME label="$INFO"
fi