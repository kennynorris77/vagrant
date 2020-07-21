#! /bin/bash

#updating centos with any patches 
yum update -y --exclude=kernel

# installing tools
yum install -y nano git unzip screen 

# installing tools 
yum install -y httpd httpd-devel httpd-tools 
chkconfig --add httpd 
chkconfig  httpd on 
service httpd stop 

rm -rf /var/www/html 
ln -s /vagrant /var/www/html 

service httpd start

# install php 
yum install -y php php-cli php-common php-devel php-mysql 

#mysql 
yum install -y mysql mysql-server mysql-devel 
chkconfig --all mysqld
chkconfig mysqld on 

service mysqld start 

mysql -u root -e "SHOW DATABASES";

# download starter content 

cd /vagrant 
sudo -u vagrant wget -q https://raw.githubusercontent.com/kennynorris77/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/kennynorris77/vagrant/master/files/info.php

service httpd restart 

