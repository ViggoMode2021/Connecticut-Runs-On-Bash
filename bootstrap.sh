#!/usr/bin/env bash

sudo apt install git                                                                                                                                                                   
# Alternatively you can use the official docker install script
wget -qO- https://get.docker.com/ | sh

# Install docker-compose
COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1`
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-cleanup command
cd /tmp
git clone https://gist.github.com/76b450a0c986e576e98b.git
cd 76b450a0c986e576e98b
sudo mv docker-cleanup /usr/local/bin/docker-cleanup
sudo chmod +x /usr/local/bin/docker-cleanup

mkdir docker-database-success-academy
cd docker-database-success-academy

git clone https://github.com/jdaarevalo/docker_postgres_with_data.git

cd docker_postgres_with_data
sudo docker-compose up -d

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

sudo groupadd students

sudo cat > students.txt<< EOF
Bill
Anna
Hector
Maria
EOF

for name in $( cat students.txt ); do
    sudo useradd -m $name
    echo "User $name added successfully!"
    echo $name:$name"123" | chpasswd
    echo "Password for user $name changed successfully"
done

for name in $( cat students.txt ); do 
  sudo usermod -a -G students "$name";
  echo "User $name added successfully to the group titled Students!"
done

sudo cat > sudoers.sh<< EOF
#!/usr/bin/env bash
while [[ -n $1 ]]; do
    echo "$1    ALL=(ALL:ALL) ALL" >> /etc/sudoers;
    shift # shift all parameters;
done
EOF

sudo ./sudoers.sh Larry Lori Bob

sudo rm sudoers.sh
