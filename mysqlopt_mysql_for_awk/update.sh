#! /bin/bash

usage(){ echo "Usage:$0 <data_file>"; exit 1; }

if [ $# -ne 1 ]; then
    usage
    exit 0
fi

ERR_FILE="add.error"

HOST1="XXX.XXX.XXX.XXX"
HOST2="XXX.XXX.XXX.XXX"
#grammar
HOSTS="$HOST1 $HOST2"

DATA_FILE="$1"

DATABASE="database"
TABLE="tablename"

#grammar mysql
MYSQL_CMD="mysql -N -B --connect_timeout=10 -uXXXX -pXXXX "$DATABASE

#grammar for
for HOST in $HOSTS;do
if [ -f $DATA_FILE ];then
	#grammar awk lshift or strtonum printf
    UPDATE_CMD=`cat $DATA_FILE | \ 
	awk '{
		printf("UPDATE tablename SET filed3 = %s , filed4 = %s WHERE id = %s;", $3, $4, or(lshift(strtonum($1),16),strtonum($2))); 
	}'`

	#grammar mysql
    MYSLQ_DB_STR=$MYSQL_CMD" -h "$HOST 
    echo $UPDATE_CMD | $MYSLQ_DB_STR 2> $ERR_FILE 
fi
done

exit 0
