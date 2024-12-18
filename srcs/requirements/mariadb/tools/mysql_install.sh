#!/bin/bash

/etc/init.d/mariadb start 2>/dev/null

if [ -d /var/lib/mysql/$WORDPRESS_DATABASE_NAME ]
then
	echo "mysql already done."
else
	echo "DELETE FROM mysql.user WHERE USER='';" >> mysql_secure_installation.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> mysql_secure_installation.sql;
	echo "DELETE FROM mysql.user WHERE USER='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> mysql_secure_installation.sql
	echo "DROP DATABASE IF EXISTS test;" >> mysql_secure_installation.sql
	echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" >> mysql_secure_installation.sql
	echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> mysql_secure_installation.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" >> mysql_secure_installation.sql;
	echo "FLUSH PRIVILEGES;" >> mysql_secure_installation.sql

	mysql -sf < mysql_secure_installation.sql

	echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE_NAME;" >> wordpress_database_initiate.sql
	echo "CREATE USER '$WORDPRESS_DATABASE_USER'@'%' IDENTIFIED BY '$WORDPRESS_DATABASE_PASSWORD';" >> wordpress_database_initiate.sql
	echo "GRANT ALL ON $WORDPRESS_DATABASE_NAME.* TO '$WORDPRESS_DATABASE_USER'@'%';" >> wordpress_database_initiate.sql
	echo "FLUSH PRIVILEGES;" >> wordpress_database_initiate.sql

	mysql -sfu root --password=$MYSQL_ROOT_PASSWORD < wordpress_database_initiate.sql
fi

/etc/init.d/mariadb stop 2>/dev/null

mysqld -u root --console
