#!/bin/bash

set -e
sourcefile=$1
dest=$2
blueprint=$3
container=$4

sourceDir=$(dirname "$sourcefile")
filename=$(basename "$sourcefile")
destDir=$(dirname "$dest")
destfile=$(basename "$dest")
size="$(du -ch ~/${blueprint}/${sourcefile}.ser | grep total)"


sudo docker exec -it ${container} [ ! -d /root/${blueprint}/${destDir} ] && sudo docker exec -it ${container} mkdir /root/${blueprint}/${destDir}
sudo chmod -R 777 ~/${blueprint}
sudo chmod 777 ~/${blueprint}/${sourcefile}.ser

cp ~/${blueprint}/${sourcefile}.ser ~/${blueprint}/${dest}.ser

