# DockerELK

Demo dockerized ELK stack reachable at localhost:5601. Consists of the following containers: a mock server supplying JSON messages, logstash, Elasticsearch, Kibana.
To launch, simply call ```./launch```; after the setup, curl port 5601 to see Kibana with gradually accumulating data.
![Alt text](DockerELK_V3.png?raw=true "Title")

Before launching, I recommend removing all running and stopped containers from the host to avoid naming and port collisions.

Requirements: ```Docker```, ```Bash```. Elasticsearch container can run OOM on hosts with insufficient resources.
