#!/bin/bash
#######################################################################################################
# We create a directory called mysql-backup and we use it on this script to backup mysql 
# database to be uploaded to google drive via this bash script
#######################################################################################################

# DELETE BACKUP FILES FROM GITHUB/BITBUCKER OLDER THAN 3 DAYS
cd /mysql-backup; 
find /mysql-backup/*.gz -mtime +3 -type f -exec git rm -f {} \;
git commit -m 'delete old files'; 
git push; 

# BACKUP FILENAME VARIABLES
filename="backup";
filetime=`date +"%Y_%m_%d_%H:%M:%S"`;
file_ext='.gz';

# BACKUP MYSQL DATABASE USING mysqldump
mysqldump -u BACKUPMYSQL –p{your database password} {your database name} | gzip > /mysql-backup/${filename}${filetime}${file_ext}; # Dumping database into GZIP file

# SEND BACKUP DATABASE  TO GOOGLE DRIVE
cd /mysql-backup;  # Go to mysql backup directory

#Upload file to google drive
/usr/local/bin/gdrive upload /mysql-backup/${filename}${filetime}${file_ext};  
