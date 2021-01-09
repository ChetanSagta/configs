song_metadata=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)

if [ "$song_metadata" = "" ]; then
   echo ""
else
   temp_title=$(echo $song_metadata| tr -d '\n' | grep -e 'title[^)]*' -o) 
   temp_artist=$(echo $song_metadata| tr -d '\n' | grep -e 'artist[^)]*' -o)
   title=$(echo $temp_title|grep -e '[^e]".*"' -o | tr -d '"')
   artist=$(echo $temp_artist|grep -e '[^t]".*"' -o | tr -d '"')
   
   echo $title :$artist
fi
