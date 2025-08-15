#!/usr/bin/env bash

tailscale=(
	background.color="$TRANSPARENT"
	y_offset=-2
	label.drawing=off
	icon="􀤆"
	icon.color="$GREY"
	icon.padding_left=15
	update_freq=5
	script="$PLUGIN_DIR/net/tailscale.sh"
	click_script="$PLUGIN_DIR/net/tailscale_click.sh"
)

sketchybar --add item tailscale right \
	--set tailscale "${tailscale[@]}"
