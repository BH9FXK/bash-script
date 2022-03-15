#!/bin/sh
#脚本功能：每过60秒检测一次，当cpu温度低于42℃时，调整cpu频率为96MHz-1490MHz之间；
#高于46℃时，调整cpu频率为96MHz-816MHz之间。
#引入i、j变量，防止重复执行调频命令。
#低温提高主频
i=1
#高温降低主频
j=0
while true
do
  set -- $(cat /sys/class/thermal/thermal_zone0/temp \
           /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
  
  TEMP=$1
  GOVERNOR=$2

  if [ "$TEMP" -le 42000 ] && [ "$GOVERNOR" = "ondemand" ] && [ $i -eq 1 ]; then
    cpufreq-set -d 96MHz -u 1490MHz
    echo "已升频"
    i=0
    j=0
  fi

  if [ "$TEMP" -ge 46000 ] && [ "$GOVERNOR" = "ondemand" ] && [ $j -eq 0 ]; then
    cpufreq-set -d 96MHz -u 816MHz
    echo "已降频"
    i=1
    j=1
  fi
  
  echo "当前cpu温度:"$(($TEMP / 1000))"℃"
  echo $i $j "(降频1 1；升频0 0；初始1 0)"
  sleep 180
done
