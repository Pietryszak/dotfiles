#!/bin/sh
xrandr --output HDMI-2 --mode 2560x1440 --pos 2560x0 --rotate right --output DP-1-8 --primary --mode 2560x1440 --pos 0x761 --rotate normal

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	killall -q polybar
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	if [[ "$style" == "cuts" ]]; then
		polybar -q first-vertical -c "$dir/$style/config.ini" &
		polybar -q second-vertical -c "$dir/$style/config.ini" &

	else
		#👇 👉 launching multiple monitors --> make sure to add monitor = ${env:MONITOR:} in the config
		if type "xrandr"; then
		  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		    MONITOR=$m polybar -q main -c "$dir/$style/config.ini" &
		  done
		else
		  polybar -q main -c "$dir/$style/config.ini" &
		fi
	fi
}

if [[ "$1" == "--cuts" ]]; then
	style="cuts"
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme
		
	Available Themes :
	--cuts
	EOF
fi
