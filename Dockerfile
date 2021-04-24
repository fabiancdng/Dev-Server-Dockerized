FROM php:apache

RUN apt-get update && \
    docker-php-ext-install mysqli