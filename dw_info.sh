#!/bin/bash

RX=`cat /var/www/html/aprs/aprs.log | grep 'audio level =' | wc -l`
ER=`cat /var/www/html/aprs/aprs.log | grep 'Error' | wc -l`
NOTAX=$(cat /var/www/html/aprs/aprs.log | grep 'Not AX.25' | wc -l)

if [ $RX -gt 0 ] && [ $NOTAX -eq 0 ] && [ $ER -gt 0 ]; then
  echo '>@438.500MHz & 西安中继 | Er:'$ER' Rx:'$RX

elif [ $RX -gt 0 ] && [ $NOTAX -gt 0 ] && [ $ER -gt 0 ]; then
  echo '>@438.500MHz & 西安中继 | Er:'$ER' Rx:'$RX'/'$NOTAX

elif [ $RX -gt 0 ] && [ $NOTAX -eq 0 ] && [ $ER -eq 0 ]; then
  echo '>@438.500MHz & 西安中继 | Rx:'$RX

elif [ $RX -gt 0 ] && [ $NOTAX -gt 0 ] && [ $ER -eq 0 ]; then
  echo '>@438.500MHz & 西安中继 | Rx:'$RX'/'$NOTAX

elif [ $ER -gt 0 ] && [ $RX -eq 0 ]; then
  echo '>@438.500MHz & 西安中继 | Er:'$ER
else
  echo '>@438.500MHz & 西安中继 | '$(date +%A)
fi
