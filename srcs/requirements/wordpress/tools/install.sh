#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress /var/www/html/
mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
