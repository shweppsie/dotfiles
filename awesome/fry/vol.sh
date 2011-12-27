#!/bin/bash

[[ $1 == down ]] && state="down"
[[ $1 == up ]] && state="up"
[[ $2 ]] && increment=$2 || increment=1

# get the primary output sound device
sink_id=`pactl list | grep -A 2 'Sink #1' | grep 'Name: ' | sed 's/.*Name: \(.*\)$/\1/g'`

# increase or decrese the volume
if [[ "$state" == "down" ]]; then
	pactl set-sink-volume $sink_id -- -${increment}% > /dev/null
elif [[ "$state" == "up" ]]; then
	pactl set-sink-volume $sink_id -- +${increment}% > /dev/null
fi

# Print the current volume
echo `pactl list | grep -B 2 -A 10 "Name: ${sink_id}\$" | grep "[^ ]Volume:" | grep -o '[0-9]*%' | head -n 1`

