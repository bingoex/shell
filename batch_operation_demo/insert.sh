#! /bin/bash

usage(){ echo "Usage:$0 <data_file>"; exit 1; }

if [ $# -ne 1 ]; then
    usage
    exit 0
fi

HOST1="XXX.XXX.XXX.XXX"
HOST2="XXX.XXX.XXX.XXX"

HOSTS="$HOST1 $HOST2"

MYSQL_CMD="mysql -N -B --connect_timeout=10 -uXXXX -pXXXX databasename "
DATA_FILE="$1"

if [ -f $DATA_FILE ];then
	#grammar gawk  sprintf
	mysql_query=`cat $DATA_FILE | gawk --non-decimal-data '
	BEGIN { 
	cmd=0
	print "INSERT IGNORE INTO tablename (id, uin, filed1) VALUES " } 
	{ 
		if (NR == 1) { pivot="" } else { pivot="," }; 
			$1 = sprintf("%d", $1);
			printf("%s(%s, %s, %s)", pivot, 99, $1, 1) 
		} 
		END {print ";"}'`

		#garmmer for
		for HOST in $HOSTS;do
			echo ""
			echo "============================================="
			echo "Insert into mysql@$HOST"
			echo "============================================="
			echo "query: $mysql_query"

			#garmmer mysql
			mysql_cmdstr=$MYSQL_CMD" -h "$HOST 
			echo $mysql_query | $mysql_cmdstr 
		done
	fi

