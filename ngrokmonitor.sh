#!/bin/sh  
  
number=`ps -ef | grep /home/bh9fxk/ngrok | grep -v grep | grep -v "ngrokmonitor.sh" | wc -l`
if [ 0 -eq $number ]
then
	date >>/var/log.hdd/ngrok.log; /home/bh9fxk/ngrok tcp 22 >>/var/log.hdd/ngrok.log &
	sleep 30
	cat /var/log.hdd/ngrok.log | mail -s "ngrok restart -15" bh9fxk@qq.com
fi
