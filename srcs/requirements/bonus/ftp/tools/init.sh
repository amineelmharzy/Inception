#!/bin/bash

useradd -m -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

echo "user_sub_token=$FTP_USER" >> ../etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/ftp" >> ../etc/vsftpd.conf

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
