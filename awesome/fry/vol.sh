#!/bin/bash

# Description of device
DESC="Built-in Audio Analog Stereo"

REGEX="Sink #[0-9]+\n\tState: (RUNNING|SUSPENDED)\n\tName: .*\n\tDescription: ${DESC}"

[[ $2 ]] && increment=$2 || increment=1

# get the sink info
sink_id=`pactl list | pcregrep -A 10 -M "${REGEX}" | head -n 1 | sed 's/^Sink #\([0-9]\+\)$/\1/g'`

# increase or decrese the volume
if [[ "$1" == "down" ]]; then
	pactl set-sink-volume $sink_id -- -${increment}% > /dev/null
elif [[ "$1" == "up" ]]; then
	pactl set-sink-volume $sink_id -- +${increment}% > /dev/null
fi

REGEX="Sink #${sink_id}+\n\tState: (RUNNING|SUSPENDED)\n\tName: .*\n\tDescription: ${DESC}"

# print out the volume after any changes
pactl list | pcregrep -A 10 -M "${REGEX}" | grep -P '\tVolume: ' | grep -o '[0-9]\+%' | head -n 1
