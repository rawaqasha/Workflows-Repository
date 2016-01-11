#!/bin/bash

set -e
blueprint=$1
CONTAINER_NAME=$(ctx node properties container_ID)
IMAGE_NAME=$(ctx node properties image_name)

ctx logger info "Creating ${CONTAINER_NAME}"

sudo docker pull ${IMAGE_NAME}


sudo docker run -P --name ${CONTAINER_NAME} -v ~/${blueprint}:/root/${blueprint} -it -d ${IMAGE_NAME} bin/bash


