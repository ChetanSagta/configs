#!/bin/bash

spotify_status=$(ps -e | grep spotify | wc -l)

if [[ $spotify_status -le 0 ]] ;
then 
  spotify & 
  notify-send "Starting Spotify"
else
  notify-send "Spotify Already Running"
fi
