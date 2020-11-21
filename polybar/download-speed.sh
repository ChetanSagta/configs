ifstat -z 1 1 | tail -1 | awk '{print "  "$1"  " $2}'
