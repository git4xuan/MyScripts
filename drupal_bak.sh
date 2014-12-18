#!/bin/bash
#main to use scripts back something to this via Email
MYSQL_USER=pengsshg_resume0
MYSQL_PASS=93779K2#7#57Z%8c
MAIL_TO=xdhuawei2012@gmail.com
FTP_USER=drupal@xuanshao.net
FTP_PASS=djWeT6463!9W75u4
FTP_IP=64.22.112.52
FTP_backup=/
BACKUP_DATA=/home/pengsshg/www/resume/drupal
SQL_BAK_NAME=SQL_$(date +"%Y%m%d").tar.gz
DATA_BAK_NAME=DATA_$(date +"%Y%m%d").tar.gz
OLD_SQL_NAME=SQL_$(date -d -10day +"%Y%m%d").tar.gz
OLD_DATA_NAME=DATA_$(date -d -10day + "%Y%m%d").tar.gz

##Delete the old data in the backup file 
rm -rf /home/pengsshg/backup/DATA_$(date -d -3day + "%Y%m%d").tar.gz /home/pengsshg/backup/SQL_$(date -d -3day + "%Y%m%d").tar.gz
cd /home/pengsshg/backup
for db in `mysql -u$MYSQL_USER -p$MYSQL_PASS -B -N -e 'SHOW DATABASES'  | xargs `;
do
(mysqldump -u$MYSQL_USER -p$MYSQL_PASS ${db}  |  gzip -9 - > ${db}.sql.gz)
done

##tar sql with a file
tar -zcf /home/pengsshg/backup/$DATA_BAK_NAME /home/pengsshg/backup/*.sql.gz

echo "Backup for drupal" | mail -a /home/pengsshg/ -s "This is a backup for drupal" $MAIL_TO

##append a back to tar.gz
tar -zcf /home/backup/$DATA_BAK_NAME $BACKUP_DATA

##UPLOAD TO FTP WebhostingBuzz

