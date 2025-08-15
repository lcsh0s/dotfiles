#!/usr/bin/env bash

date=$(date "+%d%m%Y")

calendar=(
	background.color="$ITEM_BG"
	icon="􀉉"
	icon.padding_right=6
	icon.padding_left=10
	label="$date"
	update_freq=60
)

sketchybar --add item calendar right \
	--set calendar "${calendar[@]}"
