#!/bin/bash

echo "download workflow blueprint"
if [ ! -f TSCA-WFDS/NJ-package.tar.gz ]; then
   wget -O TOSCA-WFDS/NJ-package.tar.gz https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-WF/NJ-package/NJ-package.tar.gz
fi

#unzip Workflow
tar -zxvf TOSCA-WFDS/NJ-package.tar.gz -C TOSCA-WFDS/

#fill input file
#dir=$(pwd)
if [[ ! -d ~/wf-input ]]; then
   mkdir ~/wf-input
   cp TOSCA-WFDS/file1.txt ~/wf-input/file1.txt
   cp TOSCA-WFDS/file2.txt ~/wf-input/file2.txt
fi

sudo service docker start

echo "deploy the workflow"
if [[ -d ~/realeScWF-inhost ]]; then
   echo "previous workflow execution exists and will be deleted"
   rm -r ~/realeScWF-inhost
else 
   #mkdir ~/realeScWF-inhost
   cp TOSCA-WFDS/realeScWF-inhost.yaml .
fi

cfy local init --install-plugins -p TOSCA-WFDS/realeScWF-inhost.yaml

cfy local execute -w install
