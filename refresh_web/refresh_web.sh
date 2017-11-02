#!/bin/bash

urls=(
"http://aaaa"
"http://bbbb"
"http://cccc"
)

function getRNum()
{
    result=$[$RANDOM % $1]
    return $result
}

echo "----------------------------------------------------------"
for url in ${urls[@]} ; do
    echo  "hehe $url"
done
echo "----------------------------------------------------------"

while ((1 == 1)); do
    echo ${#urls[*]}"hehe"
    urls_num=${#urls[*]}
    getRNum $urls_num
    url_num=$?
    echo "url index "$url_num

    /usr/bin/curl ${urls[${url_num}]}  > /dev/null

    getRNum 30
    sleep_num=$?
    echo "sleep "$sleep_num
    sleep $sleep_num
done
