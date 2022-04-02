# apache2-php
- Apache2
- PHP
- GIT
# [DockerHub](https://hub.docker.com/repository/docker/chung10/apache2-php)

# Build

## 1. Stop Running Container
```bash
docker stop running-apache2-php
```
## 2. Remove Container
```bash
docker rm running-apache2-php
```
## 3. Remove Images
```bash
docker rmi apache2-php
```
## 4. Build Images
```bash
docker build -t apache2-php .
```

#### Git Clone option
```bash
docker build -t apache2-php --build-arg Git=https://github.com/Chung10Kr/phpBase.git .
```

## 6. Run Container
```bash
docker run -p 80:80 --name running-apache2-php apache2-php
```

#### Volume option
```bash
docker run -p 80:80 --volume "D:/app/:/home/app/" --name running-apache2-php apache2-php
git clone https://github.com/Chung10Kr/phpBase.git "D:/app"
```

## 7. access localhost:80



## etc command
```bash
docker ps -a
docker start running-apache2-php
docker stop running-apache2-php
docker exec -it running-apache2-php /bin/bash
```