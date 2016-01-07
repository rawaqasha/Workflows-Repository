#!/bin/bash

set -e

blueprint=$1
echo "Create workflow folder ${blueprint} and copy in the blueprint  " >> ~/depl-steps.txt
if [ ! -d ~/${blueprint} ]; then

   mkdir ~/${blueprint}

fi

ctx logger info "copy ${blueprint}.yaml to ~/${blueprint}"

cp ${blueprint}.yaml ~/${blueprint}

