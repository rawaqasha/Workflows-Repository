#!/bin/bash

echo "download workflow blueprint"
if [ ! -f TSCA-WFDS/NJ-package.tar.gz ]; then
   wget -O TOSCA-WFDS/NJ-package.tar.gz https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-package/NJ-package.tar.gz
fi

#unzip Workflow
tar -zxvf TOSCA-WFDS/NJ-package.tar.gz

#fill input file
dir=$(pwd)
if [ ! -d ~/wf-input ]; then
   mkdir wf-input
   cp ${dir}/TOSCA-WFDS/NJ-package/file1.txt ~/wf-input/file1.txt
   cp ${dir}/TOSCA-WFDS/NJ-package/file2.txt ~/wf-input/file2.txt
fi

sudo service docker start

echo "deploy the workflow"
if [ -d ~/realeScWF-inhost ]; then
   echo "previous workflow execution exists and will be deleted"
   rm -r ~/realeScWF-inhost
fi

cfy local init --install-plugins -p TOSCA-WFDS/NJ-package/realeScWF-inhost.yaml

cfy local execute -w install
