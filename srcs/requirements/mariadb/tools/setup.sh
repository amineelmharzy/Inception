#!/bin/bash

MYSQL_ROOT_PASSWORD="root"

echo "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root'" >> mysql_secure_installation.sql;
echo "DELETE FROM mysql.user WHERE USER='';" >> mysql_secure_installation.sql
echo "DELETE FROM mysql.user WHERE USER='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> mysql_secure_installation.sql
echo "DROP DATABASE IF EXISTS test;" >> mysql_secure_installation.sql
echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" >> mysql_secure_installation.sql
echo "FLUSH PRIVILEGES;" >> mysql_secure_installation.sql

mysql -sfu root < "mysql_secure_installation.sql"
