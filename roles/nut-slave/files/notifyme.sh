#! /bin/bash

# Available enviroment variables:
#
# NOTIFYTYPE: ONLINE, ONBATT, LOWBATT, ...
# UPSNAME: the name of the system that generated the change.


logger -t notifyme.sh "$NOTIFYTYPE/$UPSNAME - $*"
#echo "$*" | sendmail -F"ups@mybox" admin@example.com
#echo "$*" | mail -a "From: root@example.com" -s "Prueba" user@example.com

