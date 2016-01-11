#!/bin/bash

set -e
container1=$1

container2=$2
	
a=${@}

for var in "$@"
do
  sudo docker rm -f "${var}"
done


