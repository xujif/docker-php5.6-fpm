# docker-php5.6-cli
a docker with php5.6 base on centos
FROM daocloud.io/centos:6
MAINTAINER xujif 
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum update -y
RUN yum install -y nginx fontconfig php56w php56w-mbstring php56w-gd php56w-dom php56w-pdo php56w-mysqlnd
CMD ['php', '-v']
