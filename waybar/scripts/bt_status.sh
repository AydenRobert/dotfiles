#!/bin/bash
DEVICE_NAME="WF-1000XM5"

# Default icon
ICON=""

# Check connected devices
if bluetoothctl info | grep -q "Connected: yes"; then
    if bluetoothctl info | grep -q "$DEVICE_NAME"; then
        ICON="󰥰"
    else
        ICON=""
    fi
fi

echo "{\"text\": \"$ICON\"}"
