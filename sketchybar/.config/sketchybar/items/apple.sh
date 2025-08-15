apple=(
	icon=""
	icon.padding_left=2
	icon.padding_right=10
	label.drawing=false
	icon.color="$LAVENDER"
	background.color="$TRANSPARENT"
	background.border_width=0
	icon.font="JetbrainsMono Nerd Font:Medium:22.0"
	click_script="open \"x-apple.systempreferences:com.apple.General-Settings.extension\""
)

sketchybar --add item apple left \
	--set apple "${apple[@]}"
