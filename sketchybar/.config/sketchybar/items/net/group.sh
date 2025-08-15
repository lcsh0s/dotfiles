#!/usr/bin/env bash

killall network_load >/dev/null 2>&1
nohup "$CONFIG_DIR/helpers/network_load/bin/network_load" en0 network_update 4.0 >/dev/null 2>&1 &

source "$ITEM_DIR/net/up.sh"
source "$ITEM_DIR/net/down.sh"
source "$ITEM_DIR/net/wifi.sh"
source "$ITEM_DIR/net/tailscale.sh"

bracket=(
	background.color="$ITEM_BG"
	y_offset=-2
)

sketchybar --add bracket net_group wifi.up wifi.down wifi tailscale \
	--set net_group "${bracket[@]}"
