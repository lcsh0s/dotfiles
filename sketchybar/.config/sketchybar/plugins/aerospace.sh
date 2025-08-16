#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 8 \
		--set $NAME background.color="$ITEM_BG" \
		--set $NAME background.border_width=1
else
	sketchybar --animate tanh 8 \
		--set $NAME background.color="$TRANSPARENT" \
		--set $NAME background.border_width=0
fi
