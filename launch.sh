#!/bin/sh

docker network create elk-network
docker build -t docker_elk/server_img -f server_build.df .
docker run -d -p 8000:8000 --name docker_elk_server --net=elk-network docker_elk/server_img
docker run -d -p 9200:9200 --name docker_elk_es --net=elk-network elasticsearch:5.1
docker run -it --net=elk-network -v /Users/iOS_Coder/DockerELK/pipeline/:/usr/share/logstash/pipeline/ docker.elastic.co/logstash/logstash:5.1.2 
