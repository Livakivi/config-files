#!/bin/bash

STATE_FILE="/tmp/hypr_gap_state"
WS=$(hyprctl activeworkspace -j | jq '.id')

# Check if current workspace has gaps on
STATE=$(grep -w "$WS" "$STATE_FILE" 2>/dev/null | awk '{print $2}')

if [[ "$STATE" == "1" ]]; then
    # Turn gaps off and radius to 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
    sed -i "/^$WS /d" "$STATE_FILE"
    echo "$WS 0" >> "$STATE_FILE"
else
    # Turn gaps on and radius to your desired value (e.g., 10)
    hyprctl keyword general:gaps_in 5
    hyprctl keyword general:gaps_out 20
    hyprctl keyword decoration:rounding 10
    sed -i "/^$WS /d" "$STATE_FILE"
    echo "$WS 1" >> "$STATE_FILE"
fi
