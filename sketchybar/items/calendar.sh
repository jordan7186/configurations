#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon.drawing=off \
                          label.font="Hack Nerd Font:Bold:14.0" \
                          label.color=0xffffffff \
                          update_freq=30 \
                          padding_right=10 \
                          script="$PLUGIN_DIR/calendar.sh" \
                          click_script="$PLUGIN_DIR/calendar.sh click"