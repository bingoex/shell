#!/bin/bash

#grammar set -x  :print the exe statements
#set -x

ONE_DAY_SECOND=86400

DATA_DIR="/data/"

#dataform : 20160910
BEGIN_DATE=$1
END_DATE=$2

COMPANY=$3

FILENAME="/data/${COMPANY}"
DAY_NUM=$(((`date -d"${END_DATE}" +%s` - `date -d"${BEGIN_DATE}" +%s`)/ONE_DAY_SECOND))

echo $FILENAME
mkdir -p ${DATA_DIR}

#get all data
for ((i = 0; i <= DAY_NUM; i ++)); do
	#grammar date
	t1=`date -d"${BEGIN_DATE}" +%s`
	t2=$((t1 + ONE_DAY_SECOND * i))
	TheDate=`date -d"1970-01-01 UTC "$t2" seconds" +"%Y%m%d"`
	
	mkdir -p  ${DATA_DIR}${COMPANY}/${TheDate}

	#grammar read -d
	while read -d ' ' entry
	do
		if [ -n "$entry" -a "${entry}" != "NULL" -a "${entry}" != " " ]
		then
			#log.sh to get the actual data
			./log.sh -u $entry -s ${TheDate} -e ${TheDate} >  ${DATA_DIR}${COMPANY}/${TheDate}/${entry}.data &
			#sleep 1
		fi
	done < $FILENAME
done


#state
echo "Company Id :"$COMPANY
for ((i = 0; i <= DAY_NUM; i ++)); do
	t1=`date -d"${BEGIN_DATE}" +%s`
	t2=$((t1 + ONE_DAY_SECOND * i))
	TheDate=`date -d"1970-01-01 UTC "$t2" seconds" +"%Y%m%d"`

	num=0;	
	total=0

	while read -d ' ' entry
	do
		if [ -n "$entry" -a "${entry}" != "NULL" -a "${entry}" != " " -a "${entry}" != "" ]
		then
			result=`cat ${DATA_DIR}${COMPANY}/${TheDate}/${entry}.data`
			if [ -n "$result" -a "${result}" != "NULL" -a "${result}" != "no record" ]
			then
				#grammar $(())
				num=$(($num+1))
				#echo "$result"
			fi
			total=$(($total+1))
		fi
	done < $FILENAME

	echo "Data:"$TheDate" "$num"/"$total
done


