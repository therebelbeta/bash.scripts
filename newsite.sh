#!/usr/bin/env bash
# Install a new Virtual Host on an Ubuntu system
# REQUIRES SUDO
# Author: trentoswald@therebelrobot.com

DOMAIN=$1
SERVERPATH=$2
apt-get install nano
mkdir $SERVERPATH
chmod -R 755 $SERVERPATH
chown www-data:www-data $SERVERPATH
cd $SERVERPATH
nano index.html <<LANDING
	<html>
		<head>
		</head>
		<body>
			<h1>Congratuations!</h1>
			<h2>$DOMAIN has been successully configured</h2>
		</body>
	</html>
LANDING
mv index.html.save index.html
chown www-data:www-data index.html
chmod 644 index.html
nano /etc/apache2/sites-available/$DOMAIN <<EOF
	<VirtualHost *:80>
		ServerName $DOMAIN
		DocumentRoot $SERVERPATH
		<Directory $SERVERPATH/>
			DirectoryIndex index.html index.cgi index.pl index.php index.xhtml
			Options Indexes FollowSymLinks MultiViews
			AllowOverride All
			Order allow,deny
			allow from all
		</Directory>
	</VirtualHost>
EOF
mv /etc/apache2/sites-available/$DOMAIN.save /etc/apache2/sites-available/$DOMAIN
a2ensite $DOMAIN
/etc/init.d/apache2 restart
if [ $3 == 'local' ]
then
  echo -e "127.0.0.1 $DOMAIN" >> /etc/hosts
fi
# if [ $4 == 'dns' ]
# then
#   echo -e "127.0.0.1 $DOMAIN" >> /etc/hosts
# fi