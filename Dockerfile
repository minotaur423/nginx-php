FROM rockylinux:9

COPY conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN dnf -y install dnf-utils sudo && \
    dnf -y install nginx && \
    dnf config-manager --set-enabled crb && \
    dnf -y install epel-release && \
    dnf -y install \
        php \
        php-fpm \
        php-mbstring \
        php-mysqlnd \
        php-pecl-mcrypt && \
   dnf clean all

RUN mkdir /nginx_php && mkdir /run/php-fpm 

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY conf/www.conf /etc/php-fpm.d/www.conf

COPY conf/start.sh /nginx_php/start.sh

COPY webroot/index.php /nginx_php/index.php

RUN chmod a+x /nginx_php/start.sh

CMD [ "/nginx_php/start.sh" ]
