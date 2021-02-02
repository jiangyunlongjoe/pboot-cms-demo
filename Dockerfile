FROM php:7.2
RUN usermod -u 1000 www-data && echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" > /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >> /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    && apt-get update  \
    && apt-get install --assume-yes apt-utils  -y \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev  \
    && apt-get clean \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  \
    && docker-php-ext-install gd mbstring mysqli pdo pdo_mysql shmop  \
    && rm -f /usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini  
ADD PbootCMS.tar /var/www/html 
RUN chmod 777 -R /var/www/html/
