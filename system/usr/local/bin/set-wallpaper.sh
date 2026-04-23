#!/bin/bash

# $1: the full path to the image file passed by Thunar (%f)
IMAGE="$1"

# Validate that the file exists and is readable
  # -f: true if file exists and is a regular file (not directory)
  # If validation fails, exit with error code 1
if [[ ! -f "$IMAGE" ]]; then
    echo "Error: Image file not found: $IMAGE" >&2  # >&2 sends message to stderr (error stream)
    exit 1
fi

# swaymsg: Sway's IPC client — sends commands to the running Sway compositor
# output '*": target all outputs (displays)
# bg: set the background image
# "$IMAGE': path to the selected image
# fill: scale mode — fills the screen, cropping if needed (alternatives: stretch, fit, center, tile)
swaymsg "output '*' bg '$IMAGE' fill"

# sed: stream editor — modifies text in files
# -i: in-place (edit the file directly, no temp file)
# s|...|...|: substitute pattern with replacement
# output \* bg .* fill: matches the current wallpaper line in the sway config
# output * bg $IMAGE fill: replaces it with the new image path
# ensures wallpaper persists across reboots (sway reads this line on startup)
sed -i "s|output \* bg .* fill|output * bg $IMAGE fill|" /home/pi/.config/sway/config

# Check if sed succeeded (exit code 0 = success)
# If sed failed to match/replace, warn the user
if [[ $? -ne 0 ]]; then
    echo "Warning: Could not update sway config (pattern may have changed)" >&2
    # Don't exit with error — wallpaper is set live even if config update fails
    exit 0
fi

echo "Wallpaper set and config updated: $IMAGE"
