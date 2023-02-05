#!/bin/local/bash

sudo cat > users.txt<< EOF
Bill
Anna
Hector
Maria
EOF

for i in $( cat users.txt ); do
    sudo useradd $i
    echo "user $i added successfully!"
    echo $i:$i"123" | chpasswd
    echo "Password for user $i changed successfully"
done

: '
# users.txt
Bill
Anna
Hector
Maria
'

for i in $( cat users.txt ); do
    sudo cat /etc/passwd | grep -E '$i' 
done

#sudo cat /etc/passwd | grep -E 'Bill|Anna'
