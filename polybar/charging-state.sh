#!/bin/bash

charging_state=$(upower -i `upower -e | grep 'BAT'` | grep state | awk '{print $2}')
percentage=$(upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{print $2}')

if [ "$charging_state" = "charging" ];
then
    echo '  '
    sleep 0.3
    echo  '  '
    sleep 0.3
    echo  '  '
    sleep 0.3
    echo  '  '
    sleep 0.3
    echo  '  '
    sleep 0.3
    echo  '  '
    sleep 0.3
	echo '  '
else 
  echo '  '  
fi
