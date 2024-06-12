FROM	debian:bookworm

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom redis image based on debian:bookworm (12) image"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	redis \
	&& rm -rf /var/lib/apt/lists/*

COPY	tools/init_redis.sh .
RUN	chmod +x init_redis.sh

EXPOSE	6379
CMD	["./init_redis.sh"]
