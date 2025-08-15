#!/usr/bin/env bash

ICON="󰤮"
COLOR="$GREY"

wifi=(
	icon="$ICON"
	icon.color="$COLOR"
	icon.font="$FONT_FACE:Bold:17"
	background.color="$TRANSPARENT"
	background.padding_right=15
	update_freq=5
	label.drawing=off
	script="$PLUGIN_DIR/net/wifi.sh"
	click_script="open /System/Library/PreferencePanes/Network.prefPane"
	y_offset=-2
)

sketchybar --add item wifi right \
	--subscribe wifi wifi_change mouse.entered mouse.exited \
	--set wifi "${wifi[@]}"
