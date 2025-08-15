#!/bin/bash

bar=(
	position=top
	height=40
	blur_radius=0
	color="$TRANSPARENT"
)
sketchybar --bar "${bar[@]}"

default=(
	padding_left=3
	padding_right=3
	background.color="$ITEM_BG"
	background.corner_radius=10
	background.height=35
	icon.color=$WHITE
	icon.y_offset=1
	label.color=$WHITE
	label.y_offset=1
	icon.padding_left=10
	icon.padding_right=4
	label.padding_left=4
	label.padding_right=10
	label.font="$FONT_FACE:Bold:15"
)

sketchybar --default "${default[@]}"
