#!/bin/sh

docker network create elk-network
docker build -t docker_elk/server_img -f server_build.df .
docker build -t docker_elk/logstash_img -f logstash_build.df .
docker run -d --name docker_elk_server --net=elk-network docker_elk/server_img
docker run -d -p 9200:9200 --name elasticsearch --net=elk-network elasticsearch:5.1
docker run -d --name logstash --net=elk-network docker_elk/logstash_img 
