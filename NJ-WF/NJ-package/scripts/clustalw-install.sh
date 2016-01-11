#!/bin/bash

set -e

CONTAINER_NAME=$1
Lib_URL=$2

#ctx logger info "Installing ClustalW lib on ${CONTAINER_NAME}"

        set +e
	  Wget=$(sudo docker exec -it ${CONTAINER_NAME} which wget)
        set -e
	if [[ -z ${Wget} ]]; then
         	sudo docker exec -it ${CONTAINER_NAME} apt-get update
  	        sudo docker exec -it ${CONTAINER_NAME} apt-get -y install wget
        fi
if [[ ! -d "work" ]]; then
    sudo docker exec -it ${CONTAINER_NAME} wget ${Lib_URL}
    sudo docker exec -it ${CONTAINER_NAME} tar -zxvf clustalw-2.1-linux-x86_64-libcppstatic.tar.gz
fi


