#!/bin/bash

charging_state=$(upower -i `upower -e | grep 'BAT'` | grep state | awk '{print $2}')
percentage=$(upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{print $2}')
time=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep time | awk '{print $4" " $5}')
if [ "$charging_state" = "charging" ];
then
  xbacklight -set 60
  xrandr -r 300
  echo '' $time
  sleep 0.3
  echo  '' $time
  sleep 0.3
  echo  '' $time
  sleep 0.3
  echo  '' $time
  sleep 0.3
  echo  '' $time
  sleep 0.3
  echo  '' $time
  sleep 0.3
  echo '' $time
else

if [[ ${percentage::-1} -lt 20 ]];
then
  notify-send "Low Battery"
fi
  xbacklight -set 30
  xrandr -r 60
  echo '' $time
fi


