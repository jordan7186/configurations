#!/bin/bash
# macOS GPU usage for SketchyBar (Apple Silicon)

# Get GPU usage from powermetrics (requires sudo) or use Activity Monitor approach
# For Apple Silicon, we can estimate GPU usage via ioreg

# Try to get GPU usage - this works on Apple Silicon Macs
GPU_USAGE=$(ioreg -r -d 1 -c IOAccelerator 2>/dev/null | grep -i "PerformanceStatistics" -A 20 | grep -i "GPU Activity" | head -1 | awk -F'= ' '{print $2}' | tr -d ' ')

if [ -z "$GPU_USAGE" ]; then
  # Fallback: try to get from system_profiler (less accurate but works)
  # Show "N/A" if we can't get GPU info
  GPU_USAGE="--"
else
  # Convert to percentage if needed
  GPU_USAGE="${GPU_USAGE}%"
fi

sketchybar --set "$NAME" label="$GPU_USAGE"
