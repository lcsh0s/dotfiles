#!/usr/bin/env bash

time=$(date | awk '{print $4 }' | cut -d: -f1,2)

clock=(
	background.color="$ITEM_BG"
	icon="􀐫"
	icon.padding_right=4
	icon.padding_left=11
	icon.color="$BLUE"
	label="$time"
	y_offset=-2
	update_freq=10
	script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right \
	--set clock "${clock[@]}"
