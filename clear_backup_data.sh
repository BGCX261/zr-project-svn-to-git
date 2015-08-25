#!/bin/bash
DeleteBackupFile(){
maxdate=`date -d '-3 day' +%Y%m%d2159`
mindate=`date -d '-4 day' +%Y%m%d2359`
touch -t $maxdate maxfile
touch -t $mindate minfile
find . -newer minfile ! -newer maxfile |xargs rm -f
rm -f maxfile
rm -f minfile
dateflag=`date -d '-6 day' +%Y%m%d2359`
touch -t $dateflag flagfile
find . ! -newer flagfile |xargs rm -f
rm -f flagfile
}
for directory in /data/backup/mysql_backup/*;do
if [ -d $directory ];then
cd $directory
DeleteBackupFile
fi
done
