FROM	debian:bookworm

LABEL   vendor="madebyamine"
LABEL   version="1.0"
LABEL   description="Custom ftp image based on debian:bookworm (12) image"
LABEL   release_date="2024-01-01"

WORKDIR	main/

RUN	apt-get update && apt-get install -y \
	vsftpd \
	&& rm -rf /var/lib/apt/lists/*

COPY	conf/vsftpd.conf /etc/vsftpd.conf
COPY	tools/init.sh .
RUN	chmod +x init.sh

EXPOSE	21
EXPOSE	40000-40010
CMD	["./init.sh"]
