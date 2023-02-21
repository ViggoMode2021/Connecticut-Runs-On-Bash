#!/env/bin/bash

sudo apt-get update
sudo apt install git
yes | sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3

sudo pip3 install virtualenv

mkdir ~/myproject
cd ~/myproject

virtualenv myprojectenv

source myprojectenv/bin/activate

pip install django

pip install djangorestframework
pip install django-extensions

git clone https://github.com/ViggoMode2021/turkish-api.git

sudo ufw allow 8000

python manage.py runscript load
