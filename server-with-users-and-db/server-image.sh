#!/usr/bin/env bash

install-bash-and-docker () {

  sudo apt install git                                                                                                                                                                   
  # Alternatively you can use the official docker install script
  wget -qO- https://get.docker.com/ | sh

  # Install docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
 
}

install-bash-and-docker

clone-repo-and-docker-compose () {

  cd ~

  mkdir docker-database-success-academy
  chmod 777 docker-database-success-academy
  cd docker-database-success-academy

  git clone https://github.com/jdaarevalo/docker_postgres_with_data.git

  cd docker_postgres_with_data
  sudo docker-compose up -d

}

clone-repo-and-docker-compose

add-analysts () {

sudo cat > data-analysts.txt<< EOF
Larry
Lori
Bob
EOF

  for name in $( cat data-analysts.txt ); do
      sudo useradd -m $name
      echo "user $name added successfully!"
      echo $name:$name"123" | chpasswd
      echo "Password for user $i changed successfully"
  done

  sudo groupadd data-analysts

  for name in $( cat data-analysts.txt ); do 
    sudo usermod -a -G data-analysts "$name";
    echo "User $name added successfully to the group titled Data-Analysts!"
  done

  echo '%data-analysts ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo
  
  sudo usermod -aG sudo Larry
  sudo usermod -aG sudo Lori
  sudo usermod -aG sudo Bob

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
      echo "User $name added successfully!"
      echo $name:$name"123" | chpasswd
      echo "Password for user $name changed successfully"
  done

  for name in $( cat teachers.txt ); do 
    sudo usermod -a -G teachers "$name";
    echo "User $name added successfully to the group titled Teachers!"
  done
 
 }
 
 add-teachers
