#!/usr/bin/env bash
# Install Wordpress
# Author: trentoswald@therebelrobot.com

wget http://wordpress.org/latest.tar.gz && tar xfz latest.tar.gz && mv wordpress/* ./ && rmdir ./wordpress/ && rm -f latest.tar.gz && cp ./wp-config-sample.php ./wp-config.php && nano ./wp-config.php;
touch .htaccess;
echo '# BEGIN WordPress' >> .htaccess;
echo '<IfModule mod_rewrite.c>' >> .htaccess;
echo 'RewriteEngine On' >> .htaccess;
echo 'RewriteBase /' >> .htaccess;
echo 'RewriteRule ^index\.php$ - [L]' >> .htaccess;
echo 'RewriteCond %{REQUEST_FILENAME} !-f' >> .htaccess;
echo 'RewriteCond %{REQUEST_FILENAME} !-d' >> .htaccess;
echo 'RewriteRule . /index.php [L]' >> .htaccess;
echo '</IfModule>' >> .htaccess;
echo '# END WordPress' >> .htaccess;
sudo a2enmod rewrite;
restart apache2;