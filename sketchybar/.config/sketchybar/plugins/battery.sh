#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"
PERCENT=$(pmset -g batt | grep -Eo "[0-9]+%" | tr -d '%')

is_plugged_in() {
	local pmset_output=$(pmset -g batt)
	if echo "$pmset_output" | grep -q "AC Power"; then
		echo "true"
	else
		echo "false"
	fi
}

if [ "$(is_plugged_in)" = "true" ]; then
	INFO="AC"
else
	INFO="Battery"
fi

COLOR="$WHITE"
if [ "$PERCENT" -le 10 ]; then
	COLOR="$RED"
fi

if [ "$INFO" = "AC" ]; then
	ICON="􀢋"
else
	if [ "$PERCENT" -ge 95 ]; then
		ICON="􀛨"
	elif [ "$PERCENT" -ge 75 ]; then
		ICON="􀺸"
	elif [ "$PERCENT" -ge 50 ]; then
		ICON="􀺶"
	elif [ "$PERCENT" -ge 11 ]; then
		ICON="􀛩"
	else
		ICON="􀛪"
	fi
fi

battery=(
	icon="$ICON"
	icon.color="$COLOR"
	label="$PERCENT%"
)

sketchybar --animate tanh 30 \
	--set battery "${battery[@]}"
