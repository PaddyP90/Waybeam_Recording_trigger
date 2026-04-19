#!/bin/sh

# VTX Recording Control - Called by mSPOSD when channel 5 changes
# mSPOSD calls this with: channels.sh <channel> <pwm_value>
# Example: channels.sh 5 1234

if [ $1 -eq 5 ];then
echo "Channel5 change."

	if [ $2 -lt 1200 ];then
		echo "Disarm detected - Stop Recording"
		curl "http://192.168.1.10:80/api/v1/record/stop"

	elif [ $2 -gt 1800 ];then
		echo "ARM detected - Start Recording"
		curl "http://192.168.1.10:80/api/v1/record/start"

	fi
fi
exit 0
