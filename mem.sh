#!/bin/bash

# 获取物理内存总量
mem_total=`free | grep Mem | awk '{print $2}'`
#echo "物理内存总量："$mem_total

# 获取操作系统已使用内存总量
mem_sys_used=`free | grep Mem | awk '{print $3}'`
#echo "已使用内存总量(操作系统)："$mem_sys_used

# 获取操作系统未使用内存总量
#mem_sys_free=`free | grep Mem | awk '{print $4}'`
#echo "剩余内存总量(操作系统)："$mem_sys_free

mem_sys=`echo "scale=2;$mem_sys_used/$mem_total*100" | bc`
echo "物理内存已使用："$mem_sys"%"


# 获取应用程序已使用的内存总量
#mem_user_used=`free | sed -n 3p | awk '{print $3}'`
#echo "已使用内存总量(应用程序)："$mem_user_used

# 获取应用程序未使用内存总量
#mem_user_free=`free | sed -n 3p | awk '{print $4}'`
#echo "剩余内存总量(应用程序)："$mem_user_free

#mem_user=`echo "scale=2;$mem_user_used/$mem_total*100" | bc`
#echo "应用程序已使用内存比例："$mem_user"%"


# 获取交换分区总大小
mem_swap_total=`free | grep Swap | awk '{print $2}'`
#echo "交换分区总大小："$mem_swap_total

# 获取已使用交换分区大小
mem_swap_used=`free | grep Swap | awk '{print $3}'`
#echo "已使用交换分区大小："$mem_swap_used

# 获取剩余交换分区大小
#mem_swap_free=`free | grep Swap | awk '{print $4}'`
#echo "剩余交换分区大小："$mem_swap_free

mem_swap=`echo "scale=2;$mem_swap_used/$mem_swap_total*100" | bc`
echo "交换文件已使用："$mem_swap"%"
