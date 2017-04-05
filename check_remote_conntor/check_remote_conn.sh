#!/bin/bash
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:$PATH

while true
do
	echo $PATH
    # 8080端口可配
	netstat -an | grep :8080 | awk '{ print $5 }'| grep -v "0.0.0.0" | awk -F: '{print $1}' | sort | uniq >> tmp.netstat
	sort tmp.netstat|uniq > monitor.netstat
	sleep 1
done
