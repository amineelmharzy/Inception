FROM	debian:bookworm

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom adminer image based on debian:bookworm (12) image"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	wget \
	php \
	php-mysql \
	php-fpm \
	&& rm -rf /var/lib/apt/lists/*

COPY	tools/install.sh .
RUN	chmod +x install.sh

EXPOSE	8000
CMD	["./install.sh"]
