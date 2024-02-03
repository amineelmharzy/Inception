FROM	debian:bookworm-slim

RUN	apt update && \
	apt install wget -y && \
	rm -rf /var/lib/apt/lists/*

RUN	wget https://github.com/google/cadvisor/releases/download/v0.39.3/cadvisor && \
	chmod +x cadvisor

EXPOSE	8080

CMD	["./cadvisor"]
