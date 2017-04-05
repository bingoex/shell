#!/bin/bash

PROC_SUM=0
TOTAL=0
for DIR in `find /proc/ -maxdepth 1 -type d | egrep "^/proc/[0-9]"` ; do
	PID=`echo $DIR | cut -d / -f 3`
	PROGNAME=`ps -p $PID -o comm --no-headers`
	for SWAP in `grep Swap $DIR/smaps 2>/dev/null| awk '{ print $2 }'`
	do
		let PROC_SUM=$PROC_SUM+$SWAP
	done
	echo "PID:$PID - Swap Used: $PROC_SUM - Proc Name($PROGNAME )"
	let TOTAL=$TOTAL+$PROC_SUM
	PROC_SUM=0

done

echo "Total Swap Used: $TOTAL"

