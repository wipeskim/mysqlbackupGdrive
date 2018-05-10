# mysqlbackupGdrive

This is a bash script to backup Mysql database to Google Drive using gdrive and mysqldump. On the bash script by the default uses a directory called mysql-backup you can name to something else if you want to , make sure when you create the directory to give permissions to write, and make sure you create not on a directory available to anyone such as your www directory from your webserver.

The script will first check for files that are older then 3 days and remove them from your repository on google drive , this to be sure you don't accumulate after some time as you can runout of quota from Google Drive. You can define this as you wish, after removing the files it will run mysqldump to export your database and then send it to Google Drive.

What you need to have installed:
Mysqldump
GIT
GDRIVE 

hope it is usefull for you to backup your databases using this simple script. 
