#!/usr/bin/env bash

battery=(
	icon="􀛨"
	icon.color="$GREY"
	label="99%"
	update_freq=60
	y_offset=-2
	background.padding_left=6
	script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
	--subscribe battery power_source_change \
	--set battery "${battery[@]}"
