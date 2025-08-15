#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

wifi_status_output=$("$CONFIG_DIR/plugins/net/wifi_info.sh")
IFS=',' read -r status ip_address signal_strength <<<"$wifi_status_output"

if [ "$status" = "connected" ] && [ -n "$signal_strength" ]; then
	ICON="􀙇"
	if [ "$signal_strength" -gt -70 ]; then
		COLOR="$GREEN"
	elif [ "$signal_strength" -ge -85 ]; then
		COLOR="$YELLOW"
	else
		COLOR="$RED"
	fi
elif [ "$status" = "on" ]; then
	ICON="􀙇"
	COLOR="$WHITE"
else
	ICON="􀙈"
	COLOR="$GREY"
fi

wifi=(
	icon="$ICON"
	icon.color="$COLOR"
)

sketchybar --animate quadratic 50 \
	--set wifi "${wifi[@]}"
