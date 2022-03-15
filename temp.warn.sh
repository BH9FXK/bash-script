#!/bin/sh  
TEMP1=`tail /sys/class/hwmon/hwmon0/temp1_input`
TEMP=`echo $(($TEMP1/1000))`

if [ $TEMP -ge 45 ]; then
	echo $(date)'\nCPU temperature is '${TEMP}'℃, too HOT!' | mail -s "CPU temp Warn -15" bh9fxk@qq.com
fi
