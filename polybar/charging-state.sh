#!/bin/bash

charging_state=$(upower -i `upower -e | grep 'BAT'` | grep state | awk '{print $2}')
percentage=$(upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{print $2}')

if [ "$charging_state" = "charging" ];
then
    xbacklight -set 100
    echo ''
    sleep 0.3
    echo  ''
    sleep 0.3
    echo  ''
    sleep 0.3
    echo  ''
    sleep 0.3
    echo  ''
    sleep 0.3
    echo  ''
    sleep 0.3
	echo '' 
else 
  xbacklight -set 30
  echo '' 
fi
