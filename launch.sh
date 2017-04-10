#!/bin/sh

docker network create elk-network
docker build -t docker_elk/server_img -f server_build.df .
docker build -t docker_elk/logstash_img -f logstash_build.df .
docker build -t docker_elk/es_data -f es_data.df .
docker run -d --name docker_elk_server --net=elk-network docker_elk/server_img
docker create -v /usr/share/elasticsearch/data --name es_data_container docker_elk/es_data
docker run -d -p 9200:9200 --volumes-from es_data_container --name elasticsearch --net=elk-network elasticsearch:5.1
docker run -d --name logstash --net=elk-network docker_elk/logstash_img
docker run -d -p 5601:5601 --name kibana --net=elk-network -e ELASTICSEARCH_URL=http://elasticsearch:9200 kibana:5.1 
