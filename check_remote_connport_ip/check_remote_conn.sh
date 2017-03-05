#!/bin/bash
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin
while true
do
	echo $PATH
	netstat -an | grep :36000 | awk '{print $5}' | grep -v "0.0.0.0" | awk -F: '{print $1}' | sort | uniq >> tmp.netstat
	sort tmp.netstat|uniq > monitor.netstat
	sleep 1
done
