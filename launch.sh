#!/bin/sh

docker build -t docker_elk/server_img -f server_build.df .
docker run -d -p 8000:8000 docker_elk/server_img 
