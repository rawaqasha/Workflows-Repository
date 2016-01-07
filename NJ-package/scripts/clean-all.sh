#!/bin/bash

set -e

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

