FROM php:7.4-fpm-alpine

#RUN apt-get update && apt-get install -y \
#git \
#curl \
#zip \
#unzip

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN set -ex && \
	chmod +x /usr/local/bin/install-php-extensions && \
	install-php-extensions gd mysqli pdo_mysql pdo_pgsql \
	curl exif fileinfo intl mbstring mongodb openssl pgsql redis sockets xsl

RUN curl -sS https://getcomposer.org/installer | php -- --version=2.2.12 --install-dir=/usr/local/bin --filename=composer

RUN apk update && apk add nodejs npm

EXPOSE 9000