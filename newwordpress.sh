#!/usr/bin/env bash
# Install Wordpress
# Author: trentoswald@therebelrobot.com

wget http://wordpress.org/latest.tar.gz && tar xfz latest.tar.gz && mv wordpress/* ./ && rmdir ./wordpress/ && rm -f latest.tar.gz && cp ./wp-config-sample.php ./wp-config.php && nano ./wp-config.php;