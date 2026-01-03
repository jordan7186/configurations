#!/bin/bash

sketchybar --add item front_app left \
           --set front_app icon.drawing=off \
                           label.font="Hack Nerd Font:Bold:14.0" \
                           label.color=0xffffffff \
                           padding_left=8 \
                           script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched