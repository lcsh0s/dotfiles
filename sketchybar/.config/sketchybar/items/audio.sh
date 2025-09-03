#!/usr/bin/env bash

current_audio=$(SwitchAudioSource -c -f cli)
IFS=',' read -r name type id uid <<<"$current_audio"
volume=$(osascript -e "output volume of (get volume settings)")

label_pr=6
label_pl=8

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
	icon_pl=13
fi

audio=(
	background.padding_right=12
	label=""
	label.padding_right="$label_pr"
	label.padding_left="$label_pl"
	icon="$ICON"
	icon.padding_right=0
	icon.padding_left="$icon_pl"
	script="$PLUGIN_DIR/audio.sh"
	click_script="$PLUGIN_DIR/audio_click.sh"
)

sketchybar --add item audio right \
	--subscribe audio mouse.entered mouse.exited volume_change \
	--set audio "${audio[@]}"
