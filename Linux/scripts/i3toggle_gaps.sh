#!/usr/bin/env bash
 
# toggle_gaps [on|off|toggle]
 
INNER=10
OUTER=10
 
mode=$1
 
if [[ -z "$mode" || "$mode" == "toggle" ]]; then
 
    # Get current workspace.
    workspace=$(i3-msg -t get_workspaces \
            | jq -r '.[] | if .["focused"] then .["name"] else empty end')
    # Get current inner gap size. (0 means default)
    inner_gaps=$(i3-msg -t get_tree \
            | jq -r 'recurse(.nodes[]) | if .type == "workspace" and .name == "'"$workspace"'" then .gaps.inner else empty end')
 
    if [[   "$inner_gaps" == 0 ]]; then
        mode="on"
    else
        mode="off"
    fi
fi
 
if [[ "$mode" == "on" ]]; then
    i3-msg "gaps inner current set $INNER; gaps outer current set $OUTER"
else
    i3-msg "gaps inner current set 0; gaps outer current set 0"
fi
