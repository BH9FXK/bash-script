#!/bin/sh  
#
scp -P 13090 /var/www/html/aprs/aprs.log root@492i76t497.wicp.vip:/mnt/data/direwolf-15/direwolf-$(date +%Y%m%d).log
