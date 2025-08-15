#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

wifi_status_output=$("$CONFIG_DIR/plugins/net/wifi_info.sh")
IFS=',' read -r status ip_address signal_strength <<<"$wifi_status_output"

COLOR="$WHITE"

if [ "$status" = "connected" ] && [ -n "$signal_strength" ]; then
	if [ "$signal_strength" -gt -40 ]; then
		ICON="󰤨"
	elif [ "$signal_strength" -gt -60 ]; then
		ICON="󰤥"
	elif [ "$signal_strength" -gt -75 ]; then
		ICON="󰤢"
	elif [ "$signal_strength" -gt -90 ]; then
		ICON="󰤟"
	else
		ICON="󰤯"
	fi
elif [ "$status" = "on" ]; then
	ICON="󰤫"
else
	ICON="󰤮"
	COLOR="$GREY"
fi

wifi=(
	icon="$ICON"
	icon.color="$COLOR"
)

sketchybar --animate tanh 30 \
	--set wifi "${wifi[@]}"
