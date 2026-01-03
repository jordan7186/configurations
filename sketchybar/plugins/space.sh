#!/bin/bash

# Dynamic AeroSpace workspace display with app names
# Format: current_ws(apps) | other_ws(apps) other_ws(apps) ...

# Get current focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Get all non-empty workspaces
NONEMPTY=$(aerospace list-workspaces --monitor all --empty no 2>/dev/null | tr '\n' ' ')

# Function to get app names for a workspace
get_apps() {
  local ws=$1
  aerospace list-windows --workspace "$ws" --format '%{app-name}' 2>/dev/null | sort -u | while read -r app; do
    printf "%s " "$app"
  done | sed 's/ $//'
}

# Build the current workspace display with apps
CURRENT_APPS=$(get_apps "$FOCUSED")
if [ -n "$CURRENT_APPS" ]; then
  CURRENT_LABEL="$FOCUSED $CURRENT_APPS"
else
  CURRENT_LABEL="$FOCUSED"
fi

# Build the list of other non-empty workspaces with apps
OTHERS=""
for ws in $NONEMPTY; do
  if [ "$ws" != "$FOCUSED" ]; then
    WS_APPS=$(get_apps "$ws")
    if [ -n "$WS_APPS" ]; then
      OTHERS="${OTHERS}${ws} ${WS_APPS}   "
    else
      OTHERS="${OTHERS}${ws}   "
    fi
  fi
done

# Remove trailing spaces
OTHERS=$(echo "$OTHERS" | sed 's/  *$//')

# Set the workspace labels
sketchybar --set workspaces label="$CURRENT_LABEL"

if [ -n "$OTHERS" ]; then
  sketchybar --set workspaces_other label="$OTHERS"
else
  sketchybar --set workspaces_other label=""
fi