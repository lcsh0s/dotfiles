#!/usr/bin/env bash

ICON="󰤮"
COLOR="$GREY"

wifi=(
	icon="$ICON"
	icon.color="$COLOR"
	icon.font="$FONT_FACE:Bold:16"
	background.color="$TRANSPARENT"
	background.padding_right=15
	background.border_width=0
	update_freq=5
	label.drawing=off
	script="$PLUGIN_DIR/net/wifi.sh"
	click_script="open /System/Library/PreferencePanes/Network.prefPane"
)

sketchybar --add item wifi right \
	--subscribe wifi wifi_change mouse.entered mouse.exited \
	--set wifi "${wifi[@]}"
