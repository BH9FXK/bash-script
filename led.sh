#!/bin/bash

for ((i=1; i<=20; i++))
do
  /home/bh9fxk/led/blue_on
  sleep 1
  /home/bh9fxk/led/green_on
  sleep 1
  /home/bh9fxk/led/red_on
  sleep 1
  /home/bh9fxk/led/red_off
done
