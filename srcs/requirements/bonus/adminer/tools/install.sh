#!/bin/bash

if [ ! -f /var/www/html/adminer.php ]
then
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php
	chown -R www-data:www-data /var/www/html/adminer.php
	chmod 755 /var/www/html/adminer.php
fi
