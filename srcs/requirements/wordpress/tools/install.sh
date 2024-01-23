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
	sed -i "s/localhost/$MARIADB_HOST/" /var/www/html/wp-config.php
fi

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --allow-root \
  --path="/var/www/html" \
  --url="$WORDPRESS_URL" \
  --title="$WORDPRESS_SITE_TITLE" \
  --admin_user="$WORDPRESS_USER" \
  --admin_password="$WORDPRESS_PASSWORD" \
  --admin_email="$WORDPRESS_EMAIL"

sed -i "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/" /etc/php/8.2/fpm/pool.d/www.conf

php-fpm8.2 -F -R
