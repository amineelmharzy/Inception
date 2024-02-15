FROM	debian:bookworm-slim

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom php-fpm image based on debian:bookworm (12) image. \
	the image also install wordpress in a specific volume"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	php-fpm \
	php-mysql \
	php-redis \
	wget \
	&& rm -rf /var/lib/apt/lists/*

COPY	conf/wp-config.php .
COPY	tools/install.sh .
RUN	chmod +x install.sh

EXPOSE	9000
CMD	["./install.sh"]
