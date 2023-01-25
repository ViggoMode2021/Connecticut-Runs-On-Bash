#!/bin/bash

sudo docker ps -aq | xargs sudo docker stop | xargs sudo docker rm
sudo apt update
sudo $(aws ecr get-login --no-include-email --region us-east-1);
sudo docker pull $REGISTRY/$REPOSITORY:$IMAGE_TAG
sudo docker run -d -p 80:80 $REGISTRY/$REPOSITORY:$IMAGE_TAG
rm server-stats.txt
df | grep % > server-stats.txt
#sudo docker ps -a >> server-stats.txt
if [ $(sudo docker ps -a | grep python) = 'python' ]; then
  echo "Container is up and running" >> server-stats.txt
else
  echo > "Warning! Container is not running" >> server-stats.txt
fi
sudo ssmtp ryansviglione@gmail.com < server-stats.txt
