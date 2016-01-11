#!/bin/bash

set -e

blueprint=$1

if [ ! -d ~/${blueprint} ]; then

   mkdir ~/${blueprint}

fi

ctx logger info "copy ${blueprint}.yaml to ~/${blueprint}"

cp ${blueprint}.yaml ~/${blueprint}

