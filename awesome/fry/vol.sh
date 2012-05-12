#!/bin/bash

# Description of device
DESC="Internal Audio Analog Stereo"

[[ $1 == down ]] && state="down"
[[ $1 == up ]] && state="up"
[[ $2 ]] && increment=$2 || increment=1

# get the sink info
sink_id=`pactl list | pcregrep -A 10 -M "Sink #[0-9]+\n\tState: RUNNING\n\tName: .*\n\tDescription: ${DESC}" | head -n 1 | sed 's/^Sink #\([0-9]\+\)$/\1/g'`

# increase or decrese the volume
if [[ "$state" == "down" ]]; then
	pactl set-sink-volume $sink_id -- -${increment}% > /dev/null
elif [[ "$state" == "up" ]]; then
	pactl set-sink-volume $sink_id -- +${increment}% > /dev/null
fi

# print out the volume after any changes
pactl list | pcregrep -A 10 -M "Sink #[0-9]+\n\tState: RUNNING\n\tName: .*\n\tDescription: ${DESC}" | grep -P '\tVolume: ' | grep -o '[0-9]\+%' | head -n 1

