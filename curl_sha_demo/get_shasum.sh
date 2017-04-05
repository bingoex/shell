#!/bin/bash
set -x

# get current time 
timestamps=`date '+%s'`
token="1c6f920932912f86d4123ba90af779"

# calc the sha
signature=`echo -n "${timestamps}${token}${timestamps}" | sha256sum | cut -d ' ' -f1`

# call the http api get data
curl -H "timestamp:$timestamps"  -H "signature:$signature"  "http://idc.oa.com/station//allkey"

