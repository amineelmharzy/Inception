FROM	debian:bookworm-slim

ENV	FTP_USER="amine"
ENV	FTP_PASSWORD="amine"

RUN	apt update && \
	apt install vsftpd ftp -y && \
	rm -rf /var/lib/apt/lists/*

COPY	conf/vsftpd.conf /etc/vsftpd.conf
COPY	tools/init.sh .
RUN	chmod +x init.sh

CMD	["/bin/bash"]
