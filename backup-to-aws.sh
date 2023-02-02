#!/usr/bin/env bash

unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
file="/path/to/accessKeys.csv" # CHANGE WITH ACCESS KEYS
cnt=0
 export AWS_DEFAULT_REGION=us-east-1
 export AWS_DEFAULT_OUTPUT=text
while IFS=, read var1 var2  
do 

      if [ $cnt = 1 ]
      then 
        echo $cnt
        export AWS_ACCESS_KEY_ID=$var1
        export AWS_SECRET_ACCESS_KEY=$var2
      fi

      cnt=$(($cnt + 1))

done < <(tr -d '\r' < "${file}" )

mkdir -p -- "$script-backups"

tar -zcf usr/local/bin/script-backups/script-backup-$(date +%Y%m%d).tar.gz -C usr/local/ bin
