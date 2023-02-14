#!/usr/bin/env bash

sudo chmod -R 777 .

install-git-and-docker () {

  sudo apt install git                                                                                                                                                                   
  # Alternatively you can use the official docker install script
  wget -qO- https://get.docker.com/ | sh

  # Install docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
 
}

sudo cat > connect-to-container.txt<< EOF
docker exec -it <CONTAINER_ID> /bin/bash
psql -U postgres
EOF

install-git-and-docker

add-analysts () {

sudo cat > data-analysts.txt<< EOF
Larry
Lori
Bob
EOF

  for name in $( cat data-analysts.txt ); do
      sudo useradd -m $name
      echo "user $name added successfully!"
  done
  
  sudo groupadd data-analysts

  for name in $( cat data-analysts.txt ); do 
    sudo usermod -a -G data-analysts "$name";
    echo "User $name added successfully to the group titled Data-Analysts!"
  done
  
  for name in $( cat data-analysts.txt ); do 
    sudo chsh -s /usr/local/bin/bash
    echo "User $name shell changed to Bash!"
  done

  echo 'Larry:1111' | chpasswd
  echo 'Lori:2222' | chpasswd
  echo 'Bob:3333' | chpasswd
  
  echo '%Larry ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo
  echo '%Lori ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo
  echo '%Bob ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo

}

add-analysts

add-teachers () {

  sudo groupadd teachers

sudo cat > teachers.txt<< EOF
Bill
Anna
Hector
Maria
EOF

  for name in $( cat teachers.txt ); do
      sudo useradd -m $name
  done

  for name in $( cat teachers.txt ); do 
    sudo usermod -a -G teachers "$name";
    echo "User $name added successfully to the group titled Teachers!"
  done

  echo 'Bill:4444' | chpasswd
  echo 'Anna:5555' | chpasswd
  echo 'Hector:6666' | chpasswd
  echo 'Maria:7777' | chpasswd
 
 }
  
 add-teachers

clone-repo-and-docker-compose () {

  cd ~

  mkdir docker-database-success-academy
  chmod 770 docker-database-success-academy
  cd docker-database-success-academy

  git clone https://github.com/ViggoMode2021/docker-compose-postgres-sa.git

  cd docker-compose-postgres-sa
  sudo docker-compose up -d

}

clone-repo-and-docker-compose

#docker exec -it <CONTAINER_ID> /bin/bash
#psql -U postgres

sudo cat > send-table-to-csv.sh<< EOF
now=$(date +"%m-%d-%Y")
CONTAINER="docker-compose-postgres-sa_postgres_1"
DB="postgres"
TABLE="schools"
FILE="database-backups-${now}.csv"
sudo docker exec -u postgres ${CONTAINER} psql -d ${DB} -c "COPY ${TABLE} TO STDOUT WITH CSV HEADER " > ${FILE}
EOF

yes | sudo apt-get install awscli

sudo cat > backup-db-to-cli<< EOF
#!/usr/bin/env bash

# Remember to configure AWS CLI

sudo tar -zcf /usr/local/bin/$(date +%Y%m%d).tar.gz -C /usr/local/ bin

aws s3api put-object --bucket vig-script-backups --key script-backup-$(date +%Y%m%d).tar.gz --body /usr/local/bin/$(date +%Y%m%d).tar.gz

# Crontab syntax: 0 0 */10 * * /usr/bin/env bash ./backup-to-aws >/dev/null 2>&1

EOF
