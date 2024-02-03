FROM	debian:bookworm-slim

LABEL	vendor="madebyamine"
LABEL	version="1.0"
LABEL	description="Custom mariadb image based on debian:bookworm (12) image"
LABEL	release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update
RUN	apt-get install -y mariadb-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/my.cnf /etc/mysql/
COPY	tools/mysql_install.sh .

RUN     mkdir -p /run/mysqld
RUN	chmod +x mysql_install.sh

EXPOSE	3306
CMD	["./mysql_install.sh"]
