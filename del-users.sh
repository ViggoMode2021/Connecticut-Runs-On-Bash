#!/bin/bash

cat del.txt | while read user
do
        echo "Deleting: ${user}"
        userdel -r "${user}"
done
