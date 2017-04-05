#!/bin/bash
# txt存放捞取日志的key

#grammar xargs -i {}
#grammar find -maxdepth
find ./ -maxdepth 1 -name "*.txt" |xargs -ti ./select.sh 20160829 20160831 {}
