/*exec qtile start*/
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
xrdb -merge ~/.Xresources &
exec urxvtd &
exec i3

