#cloud-config
write_files:
        - path: /home/ubuntu/docker-ubuntu.sh
          permissions: 0744
          owner: root
          content: |
            sudo apt-get update

            sudo apt-get install \
                ca-certificates \
                curl \
                gnupg \
                lsb-release

            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

            echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

            sudo apt-get update

            yes | sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

            yes | sudo apt install awscli

            aws configure set aws_access_key_id "" && aws configure set aws_secret_access_key "" && aws configure set region "us-east-1" && aws configure set output "text"

            sudo $(aws ecr get-login --no-include-email --region us-east-1)

            sudo docker pull 583715230104.dkr.ecr.us-east-1.amazonaws.com/practice-spanish-buy-flights-docker-image

            sudo docker run -d -p 80:80 583715230104.dkr.ecr.us-east-1.amazonaws.com/practice-spanish-buy-flights-docker-image
