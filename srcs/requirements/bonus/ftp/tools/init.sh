#!/bin/bash

mkdir -p /home/ftpuser/ftp/wordpress

useradd -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/wordpress
echo "user_sub_token=$FTP_USER" >> ../etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/ftp" >> ../etc/vsftpd.conf
echo "$FTP_USER" > /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

echo "FTP running at port 21"
vsftpd
