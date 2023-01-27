#!/bin/bash
for i in {1..10};
do
adduser user$i --disabled-password --gecos user$1
echo -e "inipassword\ninipassword" | passwd user$1
done
