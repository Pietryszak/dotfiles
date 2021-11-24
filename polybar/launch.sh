#!/usr/bin/env bash

# Terminate already running bar instances
#killall -q polybar
# If all your bars have ipc enabled, you can also use 
polybar-msg cmd quit

# Launch polybar

if type "xrandr"; then
for m in $(polybar --list-monitors | cut -d":" -f1); do  
	MONITOR=$m polybar --reload my-polybar &
    	done
else
  polybar --reload my-polybar &
fi
