#!/bin/bash

echo ""
echo " ========================================================= "
echo " \                 install-server.sh  Script                / "
echo " \            Choose a faster mirror for Linux           / "
echo " \                   Created by yiwen                  / "
echo " ========================================================= "
echo ""
echo " Intro: 18820909494@163.com"
echo " Copyright (C) 2020 yiwen 18820909494@163.com"
echo -e " Version: ${GREEN}1.0${PLAIN} (7 Nov 2020)"
echo ""


docker login -u 18820909494 -p docker132879
echo "创建并启动可以可视化工具服务"
#创建网络
docker network create backend
docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /public:/public --name prtainer docker.io/portainer/portainer
#echo "创建并启动nginx-rtmp服务"
docker run --name nginx-rtmp -p 1935:1935 -p 8899:80 --restart=always -d -it 18820909494/yiwen:nginx-rtmp
#echo "创建并启动onlyoffice文件服务"
docker run --name=onlyoffice -i -t -d -p 8083:80 --restart=always 18820909494/yiwen:onlyoffice
#开始安装MySQL服务器
#echo "创建并启动mysql数据库服务"
docker run -d --name mysql57 --net=backend -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pts123456. --restart=always -v /opt/meedesk-server/mysql/data:/var/lib/mysql  18820909494/yiwen:mysql
##开始安装MySQL服务器
#if [ -f /opt/mysql57-community-release-el7-10.noarch.rpm ]; then
#     rm -rf /opt/mysql57-community-release-el7-10.noarch.rpm
#fi
#wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
#rpm -ivh mysql57-community-release-el7-10.noarch.rpm
#yum install -y mysql-community-server
#开始安装MySQL服务器
#启动mysql数据库
#systemctl start  mysqld.service
##设置mysql数据库服务开机自启
#systemctl enable mysqld
#systemctl daemon-reload
#echo "查看数据库信息"
#systemctl status mysqld.service
#echo "查看数据库初始密码"
#grep 'temporary password' /var/log/mysqld.log
#echo "复制数据库初始密码回车"
#echo "Source /opt/meedesk-server/meedesk_meeting_v5.0.1.sql;"
#mysql -u root -p
#echo "创建并启动meeting-server无纸化会议系统服务"
#docker run --name meedesk-server -d -p 8088:8088 -p 15741:15741 --restart=always -v /tmp/:/tmp/  -v /opt/meedesk-server/ftp/:/opt/meedesk-server/ftp/ -v /opt/meedesk-server/config/:/config/ -t 18820909494/yiwen:meeting-server

#docker run --name meedesk-server -p 8088:8088 -p 15741:15741 -v /tmp/:/tmp/ -v /Users/yiwen/ftp/:/Users/yiwen/ftp/ -v ~/project/meedesk-server/config/:/config/ -t 18820909494/yiwen:meeting-server
