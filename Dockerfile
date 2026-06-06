FROM php:8.5.7-apache

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        mc \
        wget \
        curl \
        apt-transport-https \
        ca-certificates git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        cifs-utils \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql #https://github.com/docker-library/php/issues/62

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && docker-php-ext-install zip sockets \
    && docker-php-ext-install intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
