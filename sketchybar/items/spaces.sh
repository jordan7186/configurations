#!/bin/bash

# Dynamic AeroSpace workspace display for sketchybar
# Format: [highlighted current_workspace] app_name | other_workspaces

# Register aerospace workspace change event
sketchybar --add event aerospace_workspace_change

# Current workspace (highlighted - white background, dark text)
sketchybar --add item workspaces left \
           --set workspaces label.font="Hack Nerd Font:Bold:14.0" \
                            label.color=0xff1e1e2e \
                            icon.drawing=off \
                            padding_left=6 \
                            padding_right=0 \
                            background.drawing=on \
                            background.color=0xffffffff \
                            background.corner_radius=4 \
                            background.height=20 \
                            label.padding_left=6 \
                            label.padding_right=6 \
                            script="$PLUGIN_DIR/space.sh" \
           --subscribe workspaces aerospace_workspace_change