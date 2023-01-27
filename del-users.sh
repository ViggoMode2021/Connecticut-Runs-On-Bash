#!/bin/bash
for i in {1..10};
do
deluser user$i --disabled-password --gecos user$1
done
