FROM	debian:bookworm-slim

RUN	apt update && \
	apt install redis vim -y && \
	rm -rf /var/lib/apt/lists/*

COPY	tools/init_redis.sh .
RUN	chmod +x init_redis.sh

EXPOSE	6379
CMD	["./init_redis.sh"]
