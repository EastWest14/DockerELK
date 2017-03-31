#!/bin/sh
docker rm -vf $(docker ps -aq)
