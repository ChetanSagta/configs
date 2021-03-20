#!/bin/bash

song_metadata=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)

stripped_metadata=$(echo $song_metadata | tr -d '\n')
temp_title=$(echo $stripped_metadata | grep -P 'title".*?(".*?")' -o) 
temp_artist=$(echo $stripped_metadata | grep -P 'artist".*?(".*?")' -o)
temp_album_artist=$(echo $stripped_metadata | grep -P 'albumArtist".*?(".*?")' -o)
title=$(echo $temp_title|grep -P '[^e]".*"' -o | tr -d '"')
artist=$(echo $temp_artist|grep -P '[^t]".*"' -o | tr -d '"')
albumArtist=$(echo $temp_album_artist|grep -P '[^t]".*"' -o | tr -d '"')

if [[ "$artist" == "" ]];
then
   echo ${title:0:20}
elif [[ "$albumArtist" == "$artist" ]];
then 
   echo ${title:0:20} :${artist:0:20} 
else
   echo ${artist:0:20},${albumArtist:0:20}
fi
