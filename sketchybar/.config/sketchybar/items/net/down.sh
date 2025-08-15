#!/usr/bin/env bash

down=(
	background.color="$TRANSPARENT"
	background.padding_left=0
	icon="􀓃"
	icon.color="$GREEN"
	icon.font="$FONT_FACE:Bold:15"
	label="000 KB/s"
	label.color="$GREEN"
	script="$PLUGIN_DIR/net/down.sh"
	y_offset=-6
)

sketchybar --add item wifi.down right \
	--subscribe wifi.down network_update \
	--set wifi.down "${down[@]}"
