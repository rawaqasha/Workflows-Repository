#!/bin/bash

set -e
blueprint=$1
file=$(ctx node properties Source)
CONTAINER_ID=$2
input_dir=$3
inputFile=$4



sudo docker exec -it ${CONTAINER_ID} [ ! -d root/${blueprint} ] && sudo docker exec -it ${CONTAINER_ID} mkdir root/${blueprint}


ctx logger info "copy the input ${input_dir}/${inputFile}"

cat ${input_dir}/${inputFile} | sudo docker exec -i ${CONTAINER_ID} sh -c 'cat > /root/'${blueprint}/${file}


