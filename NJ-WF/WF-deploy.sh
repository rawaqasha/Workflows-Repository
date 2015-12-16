#!/bin/bash

echo "download workflow blueprint"
if [ ! -f TSCA-WFDS/NJ.tar.gz ]; then
   wget -O TOSCA-WFDS/NJ.tar.gz https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-WF/NJ.tar.gz
fi

#unzip Workflow
tar -zxvf TOSCA-WFDS/NJ.tar.gz

#fill input file
nano TOSCA-WFDS/NJ/input.yaml

sudo service docker start

echo "deploy the workflow"
if [ -d ~/realeScWF-inhost ]; then
   echo "previous workflow execution exists and will be deleted"
   rm -r ~/realeScWF-inhost
fi

cfy local init --install-plugins -p TOSCA-WFDS/NJ/realeScWF-inhost.yaml

cfy local execute -w install
