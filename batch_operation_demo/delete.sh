#! /bin/bash
usage(){ echo "Usage:$0 <data_file>"; exit 1; }

if [ $# -ne 1 ]; then
    usage
    exit 0
fi

HOST1="XXX.XXX.XXX.XXX"
HOST2="XXX.XXX.XXX.XXX"
HOSTS="$HOST1 $HOST2"
MYSQL_CMD="mysql -N -B --connect_timeout=10 -uXXXX -pXXXX tablename "
DATA_FILE="$1"

if [ -f $DATA_FILE ];then
	#garmmer mysql
    mysql_query=`cat $DATA_FILE | awk '
    BEGIN {print "DELETE FROM tablename WHERE " } 
    { 
      if (NR == 1){pivot=""} else {pivot="OR"}; 
      printf("%s (id = %s) ", pivot, $1) 
    } 
    END {print ";"}'`

    for HOST in $HOSTS; do
      mysql_cmdstr=$MYSQL_CMD" -h "$HOST 
      echo $mysql_query | $mysql_cmdstr
    done
fi
