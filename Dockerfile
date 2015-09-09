FROM xujif/php5.6-cli
MAINTAINER xujif <i@xujif.com>
RUN yum install -y  php56w-fpm

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php.ini  && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php.ini  && \
    sed -i "s/display_errors = Off/display_errors = stderr/" /etc/php.ini  && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 32M/" /etc/php.ini && \
    sed -i "s/;opcache.enable=0/opcache.enable=0/" /etc/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php-fpm.d/www.conf && \
    sed -i '/^listen = /clisten = 9000' /etc/php-fpm.d/www.conf && \
    sed -i '/^listen.allowed_clients/c;listen.allowed_clients =' /etc/php-fpm.d/www.conf && \
	sed -i "/^user = /cuser = root" /etc/php-fpm.d/www.conf && \
	sed -i "/^group = /cgroup = root" /etc/php-fpm.d/www.conf && \
    sed -i '/^;catch_workers_output/ccatch_workers_output = yes' /etc/php-fpm.d/www.conf
RUN	echo "clear_env = no" >> /etc/php-fpm.d/www.conf 
 

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm","-R", "-F"]
