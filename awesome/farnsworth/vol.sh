#!/bin/bash

low_vol=0
max_vol=65536
increment=$((($max_vol-$low_vol)/100)) #this is 1%

[[ $1 == down ]] && _status="down"
[[ $1 == up ]] && _status="up"

[[ $2 ]] && let _vol_increment=$2*$increment || _vol_increment=$increment

_full_line=`pacmd dump|grep "set-sink-volume"`
_sink_cmd=`echo $_full_line|cut -d" " -f1`
_sink_id=`echo $_full_line|cut -d" " -f2`
_sink_vol=`echo $_full_line|cut -d" " -f3`

if [[ "$_status" == "down" ]]; then
	let _sink_vol=$_sink_vol-$_vol_increment
elif [[ "$_status" == "up" ]]; then
	let _sink_vol=$_sink_vol+$_vol_increment
fi

[[ $_sink_vol -lt $low_vol ]] && _sink_vol=$low_vol
[[ $_sink_vol -gt $max_vol ]] && _sink_vol=$max_vol

#echo $_sink_vol
#let debug=$_sink_vol-1
#echo $debug

#let vol=$_sink_vol-0
#let vol=$vol-$low_vol
#let vol=$vol/$increment
#echo "$vol%"

pacmd $_sink_cmd $_sink_id $_sink_vol > /dev/null

#while [[ `pacmd dump | grep "set-sink-volume|cut -d\" \" -f3"` ]]; do
#	echo hi
#done

_sink_vol=`pacmd dump|grep "set-sink-volume"|cut -d" " -f3`
let vol=$_sink_vol-0
let vol=$vol-$low_vol
let vol=$vol/$increment
echo "$vol%"
