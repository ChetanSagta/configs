#!/bin/bash

# Terminate already running bar instances
killall -9 polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

# Launch bar
polybar main 2>/dev/null &

echo "Bars launched..."
