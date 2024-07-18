#!/bin/bash

if pgrep parec
then 
	# Stop recording audio
	pkill -9 parec
	notify-send "Finished recording!"
else
	# Output device (the default one)
	# For more use "pacmd list-sinks | grep -e 'name:' -e 'index' -e 'Speakers'" command
	deviceMonitor="alsa_output.usb-FiiO_DigiHug_USB_Audio-01.iec958-stereo.monitor"


	# 5-character random string
	rand=$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w 7 | head -n 1)

	# Construct filename
	filename="${PWD}/Downloads/audio_recordings/out_${rand}.mp3"

	# Record audio to the file
	notify-send "Starting recording audio to ${filename}"
	parec -d $deviceMonitor --volume=65536 | lame -r -V7 - $filename

	# Copy the file to the clipboard
	echo "file://${filename}"|xclip -i -sel c -t text/uri-list
fi
