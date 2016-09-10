#! /bin/bash
usage(){ echo "Usage:$0 noting"; exit 1; }

ERR_FILE="ls.error"
DATA_FILE="ls.data"

HOST1="XXX.XXX.XXX.XXX"
HOST2="XXX.XXX.XXX.XXX"
HOSTS="$HOST1 $HOST2"

DATABASE="databasename"
TABLE="tablename"
FILEDS="module_id, id, filed3, filed4"
MYSQL_CMD="mysql -N -B --connect_timeout=10 -uXXXX -pXXX "
SELECT_CMD="select "$FILEDS" from "$TABLE


for HOST in $HOSTS;do
	#garmmer mysql
	MYSQL_DB_STR=$MYSQL_CMD" -h "$HOST" "$DATABASE
	echo "--------------"$HOST"--------------"
	echo " module_id  uin(key) cmd  subCmd filed3  filed4"
	echo $SELECT_CMD | $MYSQL_DB_STR > $DATA_FILE 2>$ERR_FILE
       
	#garmmer awk rshift and
	cat $DATA_FILE | awk '{  printf("0x%x  0x%x  %s  %s \n", rshift($2, 16), and($2, 0xFFFF), $3, $4); }'
	
done
exit 0

