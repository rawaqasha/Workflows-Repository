#!/bin/bash

set -e

CONTAINER_NAME=$1
Lib_URL=$2

#ctx logger info "Installing git lib on ${CONTAINER_NAME}"

        set +e
	  git=$(sudo docker exec -it ${CONTAINER_NAME} which git)
        set -e
	if [[ -z ${git} ]]; then
         	sudo docker exec -it ${CONTAINER_NAME} apt-get update
  	        sudo docker exec -it ${CONTAINER_NAME} apt-get -y install git
        fi
ctx logger info "Installing MegaCC lib on ${CONTAINER_NAME}"
#sudo docker exec -it ${CONTAINER_NAME} [ ! -d "work" ] &&sudo docker exec -it ${CONTAINER_NAME} git clone ${Lib_URL}

