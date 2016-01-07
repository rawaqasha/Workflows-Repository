#!/bin/bash

set -e
blueprint=$1



for dir in ~/${blueprint}/*/
do
    d=${dir%*/}
    rm -r ${d}
done

rm ~/${blueprint}/${blueprint}.yaml
ctx logger info "Deleting ${container}"



