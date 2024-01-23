# wordpress Dockerfile

FROM	debian:bookworm-slim

WORKDIR	/app
ENV	WORDPRESS_DATABASE_PASSWORD="wordpress"
ENV	WORDPRESS_DATABASE_NAME="leonardo"
ENV	WORDPRESS_DATABASE_USER="leonardo"

RUN	apt update && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql wget && \
	rm -rf /var/lib/apt/lists/*

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/wp-config.php .
COPY	tools/install.sh .

RUN	chmod +x install.sh
EXPOSE	9000

CMD	["./install.sh"]
