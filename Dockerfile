FROM php:7.4-apache
RUN usermod -u 1000 www-data && sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && rm -f /etc/apt/sources.list.d/* \
    && apt-get update \
    && apt-get install --assume-yes apt-utils \
    && apt-get install -y libwebp-dev libjpeg-dev libpng-dev libfreetype6-dev libonig-dev \
    && apt-get clean \
    && docker-php-ext-configure gd \
       --with-webp=/usr/include/webp \
       --with-jpeg=/usr/include \
       --with-freetype=/usr/include/freetype2/ \
    && docker-php-ext-install gd mbstring mysqli pdo pdo_mysql shmop  \
    && rm -f /usr/local/etc/php/conf.d/docker-php-ext-pdo_mysql.ini  
COPY pboot-cms-demo   /var/www/html 
#COPY info.php     /var/www/html/
RUN chmod 755 -R /var/www/html/
