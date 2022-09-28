#!/bin/bash

##自动化安装mysql并且重置密码为：xw123456，并开启3306端口，开放远程连接权限
echo "正在创建mysql目录......"
cd /opt
rm -rf mysql
mkdir mysql
cd mysql
echo "正在下载mysql文件，耗时较长，请耐心等候......"
wget \
https://cdn.mysql.com/archives/mysql-5.7/mysql-community-client-5.7.32-1.el7.x86_64.rpm \
https://cdn.mysql.com/archives/mysql-5.7/mysql-community-common-5.7.32-1.el7.x86_64.rpm \
https://cdn.mysql.com/archives/mysql-5.7/mysql-community-libs-5.7.32-1.el7.x86_64.rpm \
https://cdn.mysql.com/archives/mysql-5.7/mysql-community-libs-compat-5.7.32-1.el7.x86_64.rpm \
https://cdn.mysql.com/archives/mysql-5.7/mysql-community-server-5.7.32-1.el7.x86_64.rpm
echo "正在安装mysql服务......."
yum install -y mysql-community-*-5.7.32-1.el7.x86_64.rpm
echo "正在启动mysql服务......"
systemctl start mysqld
systemctl enable mysqld
echo "开放3306端口......"
firewall-cmd --zone=public --add-port=3306/tcp --permanent
yum install expect << EOF
y
EOF
echo "获取mysql默认root密码......"
str=$(cat /var/log/mysqld.log | grep password)
echo "${str}"
word=${str#*@}
password=${word: 11}
echo "mysql密码：${password}"
echo "正在重置mysql@root用户密码为:'xw123456',并且开放远程连接权限中..."
cd /opt
chmod 777 ex.exp
expect ex.exp "${password}"
