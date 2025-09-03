#!/usr/bin/env bash

SwitchAudioSource -n >/dev/null 2>&1

current_audio=$(SwitchAudioSource -c -f cli)
IFS=',' read -r name type id uid <<<"$current_audio"
volume=$(osascript -e "output volume of (get volume settings)")

current_name=$(sketchybar --query audio | jq -r '.label.value')
label="$name"
label_pr=10
label_pl=10

if [ "$name" = "MacBook Pro Speakers" ]; then
	ICON="􀊩"
elif [ "$name" = "External Headphones" ]; then
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
	icon="$ICON"
	icon.padding_left="$icon_pl"
)

sketchybar --animate tanh 20 \
	--set audio "${audio[@]}"

current_name=$(sketchybar --query audio | jq -r '.label.value')
