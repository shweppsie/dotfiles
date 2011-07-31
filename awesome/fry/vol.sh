#!/bin/bash

low_vol=0
max_vol=100
increment=1 #this is 1%

[[ $1 == down ]] && _status="down"
[[ $1 == up ]] && _status="up"

if [[ "$_status" == "down" ]]; then
	amixer sset PCM 1dB- > /dev/null
elif [[ "$_status" == "up" ]]; then
	amixer sset PCM 1dB+ > /dev/null
fi

vol=`amixer sget PCM | grep -oE '[0-9]*%' | tail -n 1`

echo "$vol"

