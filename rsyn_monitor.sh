#!/bin/bash
ip=`ifconfig eth1|grep "inet addr" | awk -F[:" "]+ '{print $4}'`
date=$(date +"%Y-%m-%d %H:%M:%S")
zxcs=`ps aux | grep rsync_zxcs.sh | grep  -v 'grep' | wc -l`
shop=`ps aux | grep rsync_shop.sh | grep  -v 'grep' | wc -l`
pushshop=`ps aux | grep rsync_pushshop.sh | grep  -v 'grep' | wc -l`
mlinghit=`ps aux | grep rsync_mlinghit.sh | grep  -v 'grep' | wc -l`
zycs=`ps aux | grep rsync_zycs.sh | grep  -v 'grep' | wc -l`
shoplinghit=`ps aux | grep rsync_shoplinghit.sh | grep  -v 'grep' | wc -l`
admin=554688602@qq.com,wealthjackson8888@gmail.com

if [  $zxcs -lt 2 ]; then
	bash /home/shell/rsync_zxcs.sh &
        echo  '在线测算同步异常 ' $date 'from' ${ip} | mail -s "rsync_zxcs.sh is not running " $admin
fi


if [  $mlinghit -lt 2 ]; then
        bash /home/shell/rsync_mlinghit.sh &
        echo  'mlinghit检测到异常 ' $date 'from' ${ip} | mail -s "rsync_mlinghit.sh is not running " $admin
fi


#if [  $shop -lt 2 ]; then
	#bash /home/shell/rsync_shop.sh &
        #echo  'shop检测到异常 ' $date 'from' ${ip} | mail -s "rsync_shop.sh is not running " $admin
#fi

if [  $pushshop -lt 2 ]; then
	bash /home/shell/rsync_pushshop.sh &
        echo  'pushshop检测到异常 ' $date 'from' ${ip} | mail -s "rsync_pushshop.sh is not running " $admin
fi



if [  $zycs -lt 2 ]; then
	bash /home/shell/rsync_zycs.sh &
        echo  '专业测算同步异常 ' $date 'from' ${ip} | mail -s "rsync_zycs.sh is not running " $admin
fi


if [  $shoplinghit -lt 2 ]; then
	/bin/bash /home/shell/rsync_shoplinghit.sh &
        echo  '专业测算同步异常 ' $date 'from' ${ip} | mail -s "rsync_zycs.sh is not running " $admin
fi
