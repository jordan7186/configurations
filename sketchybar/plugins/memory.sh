#!/bin/bash
# macOS memory percent for SketchyBar: (App Memory + Wired + Compressed) / Total

# Get page size and total RAM
PAGE_SIZE=$(sysctl -n vm.pagesize)
TOTAL_BYTES=$(sysctl -n hw.memsize)

# Parse vm_stat output
ACTIVE=$(vm_stat | awk '/Pages active:/ {print $3}' | tr -d '.')
SPECULATIVE=$(vm_stat | awk '/Pages speculative:/ {print $3}' | tr -d '.')
WIRED=$(vm_stat | awk '/Pages wired down:/ {print $4}' | tr -d '.')
COMPRESSED=$(vm_stat | awk '/Pages occupied by compressor:/ {print $5}' | tr -d '.')

# Default to 0 if empty
ACTIVE=${ACTIVE:-0}
SPECULATIVE=${SPECULATIVE:-0}
WIRED=${WIRED:-0}
COMPRESSED=${COMPRESSED:-0}

# Calculate used memory percentage
USED_PAGES=$((ACTIVE + SPECULATIVE + WIRED + COMPRESSED))
USED_BYTES=$((USED_PAGES * PAGE_SIZE))
PERCENTAGE=$((USED_BYTES * 100 / TOTAL_BYTES))

sketchybar --set "$NAME" label="${PERCENTAGE}%"