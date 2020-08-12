#!/bin/bash

echo ""
echo " ========================================================= "
echo " \                 install-services.sh  Script                / "
echo " \            Choose a faster mirror for Linux           / "
echo " \                   Created by yiwen                  / "
echo " ========================================================= "
echo ""
echo " Intro: 18820909494@163.com"
echo " Copyright (C) 2020 yiwen 18820909494@163.com"
echo -e " Version: ${GREEN}1.0${PLAIN} (7 Nov 2020)"
echo ""

echo "查看容器版本信息"
docker version
docker login -u 18820909494 -p docker132879
echo "创建并启动可以可视化工具服务"
#创建网络
#docker network create backend
docker run -d -p 9000:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /public:/public --name prtainer docker.io/portainer/portainer
echo "创建并启动mysql数据库服务"
#--net=backend
docker run -d --name mysql57  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pts123456. --restart=always -v /opt/meeting-server/mysql/data:/var/lib/mysql -v /opt/meeting-server/mysql/config/mysqld.cnf:/etc/mysql/conf.d/mysqld.cnf -v /opt/meeting-server/mysql/sql:/docker-entrypoint-initdb.d hub.c.163.com/library/mysql:5.7
echo "创建并启动nginx-rtmp服务"
docker run --name nginx-rtmp -p 1935:1935 -p 8899:80 --restart=always -d -it 18820909494/yiwen:nginx-rtmp
echo "创建并启动onlyoffice文件服务"
docker run --name=onlyoffice -i -t -d -p 8083:80 --restart=always 18820909494/yiwen:onlyoffice
echo "创建并启动kurento-server服务"
docker run --name kms -d -p 8888:8888 --restart=always 18820909494/yiwen:kurento-server
echo "创建并启动coturn服务"
docker run --name=coturn -d -i --restart=always -p 3478:3478 -p 3478:3478/udp 18820909494/yiwen:coturn

#echo "创建并启动meeting-server无纸化会议系统服务"
#docker run --name meedesk-server -d -p 8088:8088 -p 15741:15741 --restart=always -v /tmp/:/tmp/  -v /opt/meedesk-server/ftp/:/opt/meedesk-server/ftp/ -v /opt/meedesk-server/config/:/config/ -t 18820909494/yiwen:meeting-server

#docker run --name meedesk-server -p 8088:8088 -p 15741:15741 -v /tmp/:/tmp/ -v /Users/yiwen/ftp/:/Users/yiwen/ftp/ -v ~/project/meedesk-server/config/:/config/ -t 18820909494/yiwen:meeting-server
