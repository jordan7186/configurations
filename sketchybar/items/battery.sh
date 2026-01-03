#!/bin/bash

sketchybar --add item battery right \
           --set battery icon.font="Hack Nerd Font:Bold:17.0" \
                         icon.color=0xffffffff \
                         label.font="Hack Nerd Font:Bold:12.0" \
                         label.color=0xaaffffff \
                         update_freq=120 \
                         padding_right=4 \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change