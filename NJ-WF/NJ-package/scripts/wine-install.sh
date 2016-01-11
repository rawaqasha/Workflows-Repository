#!/bin/bash

set -e

CONTAINER_ID=$1
LIBRARY_NAME=$(ctx node properties lib_name)


set +e
  wine=$(sudo docker exec -it ${CONTAINER_ID} which wine)
set -e

if [[ -z ${wine} ]]; then      
 sudo docker exec -it ${CONTAINER_ID} dpkg --add-architecture i386       
 sudo docker exec -it ${CONTAINER_ID} apt-get update
 sudo docker exec -it ${CONTAINER_ID} apt-get -y install ${LIBRARY_NAME}

fi


