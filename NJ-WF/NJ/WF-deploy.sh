wf=$1
#!/bin/bash

echo "download workflow blueprint"
if [ ! -f TSCA-WFDS/NJ.tar.gz ]; then
   wget -O TOSCA-WFDS/NJ.tar.gz https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-WF/NJ/NJ.tar.gz
fi

#unzip Workflow
tar -zxvf TOSCA-WFDS/NJ.tar.gz -C TOSCA-WFDS/

#fill input file
echo "please fill the input file for the workflow"
nano TOSCA-WFDS/input.yaml

sudo service docker start

echo "deploy the workflow"
if [[ ${wf} == 1 ]]; then
   if [[ -d ~/realeScWF-inhost ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -r ~/realeScWF-inhost
   else 
      cp TOSCA-WFDS/realeScWF-inhost.yaml .
   fi
  cfy local init --install-plugins -p TOSCA-WFDS/realeScWF-inhost.yaml
else
   if [[ -d ~/realeScWF-1host ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -r ~/realeScWF-1host
   else 
      cp TOSCA-WFDS/realeScWF-1host.yaml .
   fi
  cfy local init --install-plugins -p TOSCA-WFDS/realeScWF-1host.yaml
fi


cfy local execute -w install
