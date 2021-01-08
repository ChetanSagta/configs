song_metadata=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)

if [ "$song_metadata" = "" ]; then
   echo ""
else
   temp_title=$(echo $song_metadata|grep -w '"xesam:title" [a-zA-Z ]* "[a-zA-Z ]*"' -o)
   temp_artist=$(echo $song_metadata| tr -d '\n' | grep 'artist"[a-zA-Z \["]*' -o)
   title=$(echo $temp_title|grep ' ".*"' -o)
   artist=$(echo $temp_artist|grep ' ".*"' -o)
   
   echo $title-$artist
fi
