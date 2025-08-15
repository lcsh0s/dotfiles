#!/usr/bin/env bash

up=(
	width=0
	background.color="$TRANSPARENT"
	icon="􀓂"
	icon.color="$MAUVE"
	label="000 KB/s"
	label.color="$MAUVE"
	script="$PLUGIN_DIR/net/up.sh"
	y_offset=4
)

sketchybar --add item wifi.up right \
	--subscribe wifi.up network_update \
	--set wifi.up "${up[@]}"
