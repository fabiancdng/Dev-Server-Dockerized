# Dev-Server-Dockerized
## Apache, PHP and MariaDB for development (testing) purposes using docker-compose.

## Why did I create this?
Sometimes I need a local development environment for testing applications that I'm working on. I used to use 'XAMPP' or other tools for this but especially since I often switch devices (and even operating systems), I've decided to 'dockerize' my development (/testing) environment to be able to spin up a local MySQL (/MariaDB) or Apache server easily.

## What pre-made images does this use?
* [php:apache](https://hub.docker.com/_/php) *(latest version)*
* [mariadb:latest](https://hub.docker.com/_/mariadb) *(latest version)*
* [phpmyadmin:latest](https://hub.docker.com/_/phpmyadmin) *(latest version)*

## How to use this
1. Create a folder called 'mariadb' in the same folder as the 'docker-compose.yml' file. This is going to be your mariadb volume where all your database data will be stored.
2. Put your php / html / other files in the 'ApacheRoot' folder (this serves as a volume that points to the DocumentRoot of Apache)
3. Adjust the ports (and the timezone) in *docker-compose.yml* or just leave the default ones.
4. Change the *MYSQL_ROOT_PASSWORD*. Make sure that the one for phpmyadmin matches the one for mariadb.
5. All set! You can now start everything with
```docker-compose up -d```

## How to access everything
> You can adjust all the ports in the docker-compose.yml file.

```127.0.0.1:80``` - Apache webserver with php


```127.0.0.1:3306``` - MySQL / MariaDB server


```127.0.0.1:8080``` - phpmyadmin (use 'root' as username and the *MYSQL_ROOT_PASSWORD* as password)

## Installing custom php extensions
Since I also need the possibilty of installing custom php extensions, I created the 'Dockerfile' so that the php-apache image is a custom build. In the Dockerfile you can add all the php extensions you want to install (as far as they aren't already bundled with php).

By default the php extension 'mysqli' will be installed. You can add your own ones by listing them after the 'docker-php-ext-install' (seperated by a space).