#!/bin/bash

wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
mv wordpress/* /var/www/html
cp latest.tar.gz /var/www/html
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/$WORDPRESS_DATABASE_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DATABASE_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DATABASE_PASSWORD/" /var/www/html/wp-config.php

auth_key_line="define( 'AUTH_KEY',         'put your unique phrase here' );"
secure_auth_key_line="define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );"
logged_in_key_line="define( 'LOGGED_IN_KEY',    'put your unique phrase here' );"
nonce_key_line="define( 'NONCE_KEY',        'put your unique phrase here' );"
auth_salt_line="define( 'AUTH_SALT',        'put your unique phrase here' );"
secure_auth_salt_line="define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );"
logged_in_salt_line="define( 'LOGGED_IN_SALT',   'put your unique phrase here' );"
nonce_salt_line="define( 'NONCE_SALT',       'put your unique phrase here' );"

auth_key="define( 'AUTH_KEY',         '$(openssl rand -hex 32)' );"
secure_auth_key="define( 'SECURE_AUTH_KEY',  '$(openssl rand -hex 32)' );"
logged_in_key="define( 'LOGGED_IN_KEY',    '$(openssl rand -hex 32)' );"
nonce_key="define( 'NONCE_KEY',        '$(openssl rand -hex 32)' );"
auth_salt="define( 'AUTH_SALT',        '$(openssl rand -hex 32)' );"
secure_auth_salt="define( 'SECURE_AUTH_SALT', '$(openssl rand -hex 32)' );"
logged_in_salt="define( 'LOGGED_IN_SALT',   '$(openssl rand -hex 32)' );"
nonce_salt="define( 'NONCE_SALT',       '$(openssl rand -hex 32)' )";

sed -i "s|$auth_key_line|$auth_key|" /var/www/html/wp-config.php
sed -i "s|$secure_auth_key_line|$secure_auth_key|" /var/www/html/wp-config.php
sed -i "s|$logged_in_key_line|$logged_in_key|" /var/www/html/wp-config.php
sed -i "s|$nonce_key_line|$nonce_key|" /var/www/html/wp-config.php
sed -i "s|$auth_salt_line|$auth_salt|" /var/www/html/wp-config.php
sed -i "s|$secure_auth_salt_line|$secure_auth_salt|" /var/www/html/wp-config.php
sed -i "s|$logged_in_salt_line|$logged_in_salt|" /var/www/html/wp-config.php
sed -i "s|$nonce_salt_line|$nonce_salt|" /var/www/html/wp-config.php

wp core install \
  --url="http://ael-mhar.42.fr" \
  --title="$WORDPRESS_SITE_TITLE" \
  --admin_user="$WORDPRESS_USER" \
  --admin_password="$WORDPRESS_PASSWORD" \
  --admin_email="$WORDPRESS_EMAIL"
