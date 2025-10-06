#!/bin/bash
# Requires: jq, hyprctl

declare -A ICONS=(
  ["firefox"]=""
  ["com.mitchellh.ghostty"]=""
  ["kitty"]=""
  ["code - oss"]=""
  ["zen"]=""      # example globe/browser icon
  ["zen-browser"]="" # or whatever shows up in hyprctl
  ["spotify"]=""
  ["discord"]="󰙯"
  ["dolphin"]=""
)
WS=$(hyprctl activeworkspace -j | jq -r '.id // empty')

# If no workspace found
[[ -z "$WS" ]] && { echo "{\"text\": \"\"}"; exit 0; }

APPS=$(hyprctl clients -j | jq --argjson ws_id "$WS" -r \
  '.[] | select(.workspace.id == $ws_id) | .class')

OUT=""
for app in $APPS; do
  app_lower=$(echo "$app" | tr '[:upper:]' '[:lower:]')
  icon="${ICONS[$app_lower]}"
  [[ -z "$icon" ]] && icon=""  # fallback
  OUT+="$icon "
done

echo "{\"text\": \"${OUT% }\"}"
