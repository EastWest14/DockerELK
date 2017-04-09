#!/bin/sh

docker network create elk-network
docker build -t docker_elk/server_img -f server_build.df .
docker build -t docker_elk/logstash_img -f logstash_build.df .
docker run -d --name docker_elk_server --net=elk-network docker_elk/server_img
docker create -v /usr/share/elasticsearch/data --name elasticsearch_data aprosikhin/elasticsearchdata5_1_2
docker run -d -p 9200:9200 --volumes-from elasticsearch_data --name elasticsearch --net=elk-network elasticsearch:5.1
docker run -d --name logstash --net=elk-network docker_elk/logstash_img
docker run -d -p 5601:5601 --name kibana --net=elk-network -e ELASTICSEARCH_URL=http://elasticsearch:9200 kibana:5.1 
