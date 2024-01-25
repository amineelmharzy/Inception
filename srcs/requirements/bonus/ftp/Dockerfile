FROM	debian:bookworm-slim

WORKDIR	app/

RUN	apt update && \
	apt install vsftpd ftp -y && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/vsftpd.conf /etc/vsftpd.conf
COPY	tools/init.sh .
RUN	chmod +x init.sh

EXPOSE	21
EXPOSE	40000-40010

CMD	["./init.sh"]
