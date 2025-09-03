#!/usr/bin/env bash

current_audio=$(SwitchAudioSource -c -f cli)
IFS=',' read -r name type id uid <<<"$current_audio"
volume=$(osascript -e "output volume of (get volume settings)")

current_name=$(sketchybar --query audio | jq -r '.label.value')
label="$current_name"
label_pr=6
label_pl=8

if [ -n "$current_name" ]; then
	label_pr=10
	label_pl=10
fi

if [ "$SENDER" = "mouse.entered" ] || [ -n "$current_name" ]; then
	label="$name"
	label_pr=10
	label_pl=10
elif
	[ "$SENDER" = "mouse.exited" ] &&
		[ -n "$current_name" ]
then
	label_pr=6
	label_pl=8
	label=
fi

if [ "$name" = "MacBook Pro Speakers" ]; then
	ICON="􀊩"
elif [ "$name" = "External Headphones" ] || [ "$name" = "WH-1000XM5" ]; then
	ICON="􃍅"
else
	ICON="􀊩"
fi

icon_pl=11
if [ "$ICON" = "􀊩" ] && [ "$volume" -eq 0 ]; then
	ICON="􀊣"
	icon_pl=15
fi

audio=(
	label="$label"
	label.padding_right="$label_pr"
	label.padding_left="$label_pl"
	icon.padding_left="$icon_pl"
	icon="$ICON"
)

sketchybar --animate quadratic 40 \
	--set audio "${audio[@]}"
