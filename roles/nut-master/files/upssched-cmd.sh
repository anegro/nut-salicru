#! /bin/bash

# This script should be called by upssched via the CMDSCRIPT directive.
# 
# Here is a quick example to show how to handle a bunch of possible
# timer names with the help of the case structure.
#
# This script may be replaced with another program without harm.
#
# The first argument passed to your CMDSCRIPT is the name of the timer
# from your AT lines.

#MAILCOMMAND='sendmail -F"ups@mybox" admin@example.com'
MAILCOMMAND='mail -a "From: root@example.com" -s "Prueba" user@example.com'

case $1 in
	upsgone)
		MSG="Se ha perdido la comunicación con el SAI durante un tiempo."

		logger -t upssched-cmd.sh $MSG
		#echo "$MSG" | $MAILCOMMAND

		;;

	onbattwarn)
		MSG="Se ha estado funcionando con batería durante demasiado tiempo. Forzando apagado..."

		logger -t upssched-cmd.sh $MSG
		#echo "$MSG" | $MAILCOMMAND

        /sbin/upsmon -c fsd
        sleep 600
        #/etc/init.d/halt stop
        /etc/init.d/nut-server poweroff

		;;

	*)
		MSG="Comando no reconocido: $1"

		logger -t upssched-cmd.sh $MSG

		;;
esac

