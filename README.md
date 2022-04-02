# apache2-php-dev-env
- Apache2
- PHP
- GIT

# Build

## 1. Stop Running Container
```bash
docker stop my-running-apache
```
## 2. Remove Container
```bash
docker rm my-running-apache
```
## 3. Remove Images
```bash
docker rmi my-apache
```
## 4. Build Images
```bash
docker build -t my-apache .
```

#### Git Clone option
```bash
docker build -t my-apache --build-arg Git=https://github.com/Chung10Kr/phpBase.git .
```

## 6. Run Container
```bash
docker run -p 80:80 --name my-running-apache my-apache
```

#### Volume option
```bash
docker run -p 80:80 --volume "D:/app/:/home/app/" --name my-running-apache my-apache
git clone https://github.com/Chung10Kr/phpBase.git "D:/app"
```

## 7. access localhost:80



## etc command
```bash
docker ps -a
docker start my-running-apache
docker stop my-running-apache
docker exec -it my-running-apache /bin/bash
```