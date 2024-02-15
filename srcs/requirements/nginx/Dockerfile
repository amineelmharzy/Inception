FROM	debian:bookworm-slim

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom nginx image based on debian:bookworm (12) image"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

COPY	conf/default /etc/nginx/sites-available/default
COPY	tools/init.sh .
RUN	chmod +x init.sh

EXPOSE	443
CMD	["./init.sh"]
