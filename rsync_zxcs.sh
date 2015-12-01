#!/bin/bash
host103=10.200.1.97     
host90=10.132.43.157    
#host121=120.55.101.121 
host121=10.165.102.123  
src=/media/raid10/htdocs/zxcs/
user=webuser
dest=zxcs

/usr/local/inotify/bin/inotifywait -mrq --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e modify,delete,create,attrib $src | while read files
do
{

/usr/local/rsync/bin/rsync -vzrtopg --delete --progress --password-file=/usr/local/rsync/rsync.passwd --exclude="ljms/Runtime/*"  $src $user@$host103::$dest
/usr/local/rsync/bin/rsync -vzrtopg --delete --progress --password-file=/usr/local/rsync/rsync.passwd --exclude="ljms/Runtime/*"  $src $user@$host90::$dest
/usr/local/rsync/bin/rsync -vzrtopg --delete --progress --password-file=/usr/local/rsync/rsync.passwd --exclude="ljms/Runtime/*"  $src $user@$host121::$dest

echo "${files} was rsynced" >> /media/raid10/logs/rsync_zxcs.log  2 >&1
}

done 