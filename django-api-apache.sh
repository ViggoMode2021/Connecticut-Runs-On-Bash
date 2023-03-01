#!/env/bin/bash

sudo apt-get update
sudo apt install git
yes| sudo add-apt-repository universe

yes | sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3

sudo pip install virtualenv

git clone https://github.com/ViggoMode2021/turkish-api.git

cd turkish-api

virtualenv myprojectenv

source myprojectenv/bin/activate

pip install django
pip install djangorestframework
pip install django-extensions

python3 manage.py migrate

python3 manage.py runscript load

python3 manage.py migrate

sudo chmod 777 /etc/apache2/sites-available

sudo cat > /etc/apache2/sites-available/djangoproject.conf << EOF
<VirtualHost *:80>

	<Directory /home/ubuntu/turkish-api/words>
		<Files wsgi.py>
			Require all granted
		</Files>
	</Directory>

	WSGIDaemonProcess turkish-api python-path=/home/ubuntu/turkish-api python-home=/home/ubuntu/turkish-api/myprojectenv
	WSGIProcessGroup django_project
	WSGIScriptAlias / /home/ubuntu/turkish-api/myprojectenv/wsgi.py
</VirtualHost>

EOF

cd /home/ubuntu/turkish-api

sudo sed -i "s/DEBUG = True/DEBUG = False/" settings.py
testp=$(curl http://checkip.amazonaws.com)
echo "$testp"
sed -i "28s/\[\]/\['$testp']/" settings.py

sudo apt-get install tmux

tmux new -s django-api

python3 manage.py runserver 0.0.0.0:8000
