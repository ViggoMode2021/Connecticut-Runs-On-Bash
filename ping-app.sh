#!/usr/bin/env bash

d=$(date +%d-%m-%y)

if ping -c 1 practicespanishbuyflights.com  &> /dev/null
then
  echo "Ping successful on $d for practicespanishbuyflights.com - Remember to move scripts if not done already!" >> ping.txt
  sudo ssmtp ryansviglione@gmail.com < ping.txt
  echo "Ping worked!"
else
  echo "Ping unsuccessful on $Date for practicespanishbuyflights.com - Remember to move scripts if not done already!" >> ping.txt
  sudo ssmtp ryansviglione@gmail.com < ping.txt
  echo "Ping unsuccessful. Begin troubleshooting."
fi
