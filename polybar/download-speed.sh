#!/bin/bash

ifstat_output=$(ifstat -z 1 1| tail -1 |awk '{print $1 $2}')  
#echo $ifstat_output
if [ "$ifstat_output" = "" ];
then
   echo ""
else
   ifstat -z 1 1| tail -1 | awk '{print "  "$1"  " $2}'
fi
