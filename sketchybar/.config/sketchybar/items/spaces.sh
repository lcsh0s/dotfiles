SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

for sid in $(aerospace list-workspaces --all); do
	space=(
		label.drawing=off
		icon="${SPACE_ICONS[sid - 1]}"
		icon.padding_left=10
		icon.padding_right=10
		icon.font.size=16
		background.color="$TRANSPARENT"
		background.border_width=0
		script="$CONFIG_DIR/plugins/aerospace.sh $sid"
	)

	sketchybar --add item space.$sid left \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid "${space[@]}"
done
