#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$upload" = "" ]; then
	upload="000 KB/s"
fi

up=(
	label="$upload"
)

sketchybar --set wifi.up "${up[@]}"
