# Resin/Quercus on Alpine Linux Dockerfile
## Build
docker build -t quercus .
## Run
docker run -dp 80:80 -i undertow
## Prune
docker system prune -a  
docker builder prune  
docker container prune  
docker image prune  
docker volume prune
