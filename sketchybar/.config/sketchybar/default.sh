#!/bin/bash

bar=(
	position=top
	height=40
	blur_radius=0
	color="$TRANSPARENT"
)
sketchybar --bar "${bar[@]}"

default=(
	y_offset=-3
	padding_left=6
	padding_right=6
	background.color="$ITEM_BG"
	background.corner_radius=15
	background.height=30
	background.border_width=1
	background.border_color="0xff484954"
	icon.color=$WHITE
	icon.y_offset=1
	icon.font="$FONT_FACE:Bold:15"
	label.color=$WHITE
	label.y_offset=1
	icon.padding_left=10
	icon.padding_right=4
	label.padding_left=4
	label.padding_right=10
	label.font="$FONT_FACE:Bold:15"
)

sketchybar --default "${default[@]}"
