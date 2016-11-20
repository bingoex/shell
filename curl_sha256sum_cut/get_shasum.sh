#!/bin/bash
set -x

#get current time 
timestamps=`date '+%s'`
token="c1c60f9d20b973209172f686d3412232ba9a0f779"
#calc the sha
signature=`echo -n "${timestamps}${token}${timestamps}" | sha256sum | cut -d ' ' -f1`

# call the http api get data
curl -H "timestamp:$timestamps"  -H "signature:$signature"  "http://idc.oa.com/station//allkey"
