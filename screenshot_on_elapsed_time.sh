#!/bin/bash

fuck=q
while true; do

	running=false

	if pidof -x "/usr/bin/i3lock" >/dev/null; then
		running=true
	fi
	echo $running

	if [ "$running" = false ]; then
		if [ "$SECONDS" -gt "9" ]
		then
			filename=`date +%b-%d-%y-%H.%M.%S`
			echo $filename
			scrot -q 1 $HOME/Pictures/screenshots_script/$fuck$filename.png
			SECONDS=0
		fi
	fi

done

