# Use a Debian base image
FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/my.cnf /etc/mysql/
COPY	tools/mysql_install.sh .

RUN     mkdir -p /run/mysqld
RUN	chmod +x mysql_install.sh

EXPOSE	3306
CMD	["./mysql_install.sh"]
