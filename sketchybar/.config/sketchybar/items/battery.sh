#!/usr/bin/env bash

battery=(
	background.padding_left=12
	icon="􀛨"
	icon.color="$GREY"
	label="99%"
	update_freq=60
	script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
	--subscribe battery power_source_change \
	--set battery "${battery[@]}"
