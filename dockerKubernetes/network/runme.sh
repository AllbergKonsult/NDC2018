#!/usr/bin/env bash
# Create network
docker create network skynet

# start redis container on network
docker run -d -p 6379:6379 --net=skynet --name=redis redis

# start test container on network
docker run -p 3000:3000 --net=skynet katacoda/redis-node-docker-example
