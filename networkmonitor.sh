#!/bin/sh  
server="163.com"

ping -c 2 $server >/dev/null
if [ $? != 0 ]
then
	echo $(date)', Network disconnected!' | mail -s "Network Monitor -15" bh9fxk@qq.com
	break
#	else
#		echo 'Network connected!' | mail -s "Network Monitor" bh9fxk@qq.com
#		break
fi
