#!/bin/sh  
temp1=`tail /sys/class/hwmon/hwmon0/temp1_input`
temp=`echo "scale=1;$temp1/1000" | bc`
echo $temp℃
