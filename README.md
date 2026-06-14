# docker-apache-php8

https://hub.docker.com/_/php/

https://github.com/josefbk/docker-apache-php8

https://docs.docker.com/desktop/containerd/

    docker build -t josefbk/docker-apache-php8:8.5.7.1-apache . --platform=linux/amd64,linux/arm64
    docker push josefbk/docker-apache-php8:8.5.7.1-apache

    docker build -t josefbk/docker-apache-php8:latest . --platform=linux/amd64,linux/arm64
    docker push josefbk/docker-apache-php8:latest