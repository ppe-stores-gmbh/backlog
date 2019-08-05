#!/bin/bash
# bash script for backlog processing
# cd /your/Shopware-Verzeichnis/
PIDFILE=/tmp/plentyconnector_backlog.pid

if [ -f $PIDFILE ]
then
	echo "The process is already running."
	exit 1
else
	echo $$ > $PIDFILE

	amount=$(php bin/console plentyconnector:backlog:info | cat | head -4l | tail -1 | cut -d' ' -f7)
	#echo $amount;
	while [ $amount -gt 0 ] ; do
		echo "amount queued: $amount"
		php bin/console plentyconnector:backlog:process
		amount=$(php -d memoryLimit=8192M bin/console plentyconnector:backlog:info | cat | head -4l | tail -1 | cut -d' ' -f7)
	done
	echo "processing finished"

	rm $PIDFILE
fi
