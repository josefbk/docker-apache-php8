FROM php:8.4.0RC2-apache

RUN apt-get update
RUN apt-get install mc -y

RUN apt-get install -y \
        wget curl apt-transport-https ca-certificates git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install pdo pdo_mysql #https://github.com/docker-library/php/issues/62

RUN apt-get install -y \
        libzip-dev

RUN docker-php-ext-install zip sockets

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#https://symfony.com/download
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt-get install symfony-cli

RUN a2enmod rewrite