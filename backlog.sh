#!/bin/bash
# bash script for backlog processing
# cd /var/www/www.teleropa.de/www/
amount=$(php bin/console plentyconnector:backlog:info | cat /dev/stdin | head -4l | tail -1 | cut -d' ' -f7)
#echo $amount;
while [ $amount -gt 0 ] ; do
	echo "amount queued: $amount"
	php bin/console plentyconnector:backlog:process
	amount=$(php bin/console plentyconnector:backlog:info | cat /dev/stdin | head -4l | tail -1 | cut -d' ' -f7)
done
echo "processing finished"
