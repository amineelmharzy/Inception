#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]
then
	wget https://wordpress.org/latest.tar.gz
	tar -xf latest.tar.gz
	mv latest.tar.gz wordpress/* /var/www/html
	mv wp-config.php /var/www/html

	sed -i "s/database_name_here/$WORDPRESS_DATABASE_NAME/" /var/www/html/wp-config.php
	sed -i "s/username_here/$WORDPRESS_DATABASE_USER/" /var/www/html/wp-config.php
	sed -i "s/password_here/$WORDPRESS_DATABASE_PASSWORD/" /var/www/html/wp-config.php
	sed -i "s/localhost/ma/" /var/www/html/wp-config.php
fi

#wp core install \
#  --url="http://ael-mhar.42.fr" \
#  --title="$WORDPRESS_SITE_TITLE" \
#  --admin_user="$WORDPRESS_USER" \
#  --admin_password="$WORDPRESS_PASSWORD" \
#  --admin_email="$WORDPRESS_EMAIL"

php-fpm8.2 -F
