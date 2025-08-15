#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

output="$(/Applications/Tailscale.app/Contents/MacOS/Tailscale status 2>&1)"

if grep -q "Tailscale is stopped" <<<"$output"; then
	ts_status="off"
elif grep -q "Tailscale cannot connect" <<<"$output"; then
	if grep -q "Tailscale is starting" <<<"$output"; then
		ts_status="starting"
	else
		ts_status="off"
	fi
elif grep -q "Tailscale is starting" <<<"$output"; then
	ts_status="starting"
else
	ts_status="on"
fi

if [ "$ts_status" = "on" ]; then
	ICON="􀤆"
	COLOR="$WHITE"
elif [ "$ts_status" = "starting" ]; then
	ICON="􀤆"
	COLOR="$GREY"
else
	ICON="􁣡"
	COLOR="$GREY"
fi

ts=(
	icon="$ICON"
	icon.color="$COLOR"
)

sketchybar --set tailscale "${ts[@]}"
