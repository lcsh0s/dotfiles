#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$download" = "" ]; then
	download="000 KB/s"
fi

down=(
	label="$download"
)

sketchybar --set wifi.down "${down[@]}"
