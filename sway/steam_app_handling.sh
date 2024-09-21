#!/bin/bash

# Get the PID from the argument
WINDOW_PID=$1

# Check if Steam is in the parent process tree of the new window
if pstree -sTA "$WINDOW_PID" | head -n 1 | grep -q "steam"; then
    # If Steam is the parent, set specific rules for the window
    swaymsg [pid="$WINDOW_PID"] floating enable
    swaymsg [pid="$WINDOW_PID"] move workspace 1
    # Add more rules as needed
fi
