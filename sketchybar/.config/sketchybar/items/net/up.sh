#!/usr/bin/env bash

up=(
	drawing=off
	width=0
	background.color="$TRANSPARENT"
	background.border_width=0
	icon="􀓂"
	icon.color="$MAUVE"
	icon.font="$FONT_FACE:Bold:15"
	label="000 KB/s"
	label.color="$MAUVE"
	script="$PLUGIN_DIR/net/up.sh"
	y_offset=4
	updates=when_shown
)

sketchybar --add item wifi.up right \
	--subscribe wifi.up network_update \
	--set wifi.up "${up[@]}"
