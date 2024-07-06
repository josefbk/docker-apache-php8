# docker-apache-php8

https://github.com/josefbk/docker-apache-php8

https://docs.docker.com/desktop/containerd/

    docker build -t josefbk/docker-apache-php8:8.3.9 . --platform=linux/amd64,linux/arm64
    docker push josefbk/docker-apache-php8:8.3.9

    docker build -t josefbk/docker-apache-php8 . --platform=linux/amd64,linux/arm64
    docker push josefbk/docker-apache-php8:latest