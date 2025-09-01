#!/usr/bin/env bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

# Function to get workspaces with retry logic
get_workspaces() {
	local workspaces
	local max_attempts=30
	local attempt=1
	local sleep_duration=1

	while [ $attempt -le $max_attempts ]; do
		echo "Attempt $attempt: Getting aerospace workspaces..." >&2

		# Get the workspace list
		workspaces=$(aerospace list-workspaces --all 2>/dev/null)

		# Check if we got a valid result (non-empty and contains expected format)
		if [ -n "$workspaces" ] && echo "$workspaces" | grep -q '^[0-9]'; then
			echo "Successfully retrieved workspaces: $workspaces" >&2
			echo "$workspaces"
			return 0
		fi

		echo "No valid workspaces returned, sleeping for ${sleep_duration}s..." >&2
		sleep $sleep_duration

		((attempt++))
	done

	echo "Failed to get workspaces after $max_attempts attempts" >&2
	return 1
}

# Get workspaces with retry logic
echo "Starting aerospace workspace detection..."
workspaces=$(get_workspaces)

if [ $? -ne 0 ]; then
	echo "ERROR: Could not retrieve aerospace workspaces after multiple attempts"
	exit 1
fi

echo "Processing workspaces: $workspaces"

# Process each workspace
for sid in $workspaces; do
	if ! [[ "$sid" =~ ^[0-9]+$ ]]; then
		echo "WARNING: Skipping invalid workspace ID: $sid"
		continue
	fi

	# Check if we have an icon for this workspace (array is 0-indexed)
	if [ $sid -gt ${#SPACE_ICONS[@]} ]; then
		echo "WARNING: No icon defined for workspace $sid, using default"
		icon="$sid"
	else
		icon="${SPACE_ICONS[sid - 1]}"
	fi

	space=(
		label.drawing=off
		icon="$icon"
		icon.padding_left=10
		icon.padding_right=10
		icon.font.size=16
		background.color="$TRANSPARENT"
		background.border_width=0
		script="$CONFIG_DIR/plugins/aerospace.sh $sid"
	)

	echo "Adding workspace $sid with icon '$icon'"
	sketchybar --add item space.$sid left \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid "${space[@]}"
done

echo "Aerospace workspace setup completed successfully"
