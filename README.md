```bash

docker stop my-running-ubuntu
docker rm my-running-ubuntu
docker rmi my-ubuntu
docker build -t my-ubuntu --build-arg GIT-PATH=https://github.com/Chung10Kr/phpBase.git  .
docker build -t my-ubuntu .
docker run -p 80:80 --name my-running-ubuntu my-ubuntu

```

# Build Option
```
docker build -t my-ubuntu --build-arg GITPATH=https://github.com/Chung10Kr/SimpleApiServer.git  .
```


