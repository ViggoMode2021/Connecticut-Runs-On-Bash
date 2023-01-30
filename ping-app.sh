#!/bin/sh

url = practicespanishbuyflights.com

while ! ping -c1 $url &>/dev/null
        do echo "Ping Fail - `date`"
done
echo "Host Found - `date`"

