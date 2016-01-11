WF=$1
if [[ ! -d TOSCA-WFDS ]]; then
   echo " Creating TOSCA-WFDS folder"
   mkdir TOSCA-WFDS
fi

# docker installation
Dock=$(which docker)
echo "${Dock}"
if [[ -z ${Dock} ]]; then
   echo "Docker installation"
   if [ ! -f TSCA-WFDS/docker-installation.sh ]; then
      wget -O TOSCA-WFDS/docker-installation.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/docker-installation.sh
      chmod u+x TOSCA-WFDS/docker-installation.sh
   fi
   ./TOSCA-WFDS/docker-installation.sh
fi

#Cloudify configuration and installation
cloudify=$(which cfy)
echo "${cloudify}"
if [[ -z ${cloudify} ]]; then
   echo "Cloudify installation"
   wget -O TOSCA-WFDS/cloudify-install.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/cloudify-install.sh
   chmod u+x TOSCA-WFDS/cloudify-install.sh
   . ./TOSCA-WFDS/cloudify-install.sh
fi


#workflow deployment
echo "workflow deployment"

wget -O TOSCA-WFDS/WF-deploy.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-WF/WF-deploy.sh
chmod u+x TOSCA-WFDS/WF-deploy.sh
if [[ ${WF} == 1 ]]; then
   echo "NJ deployment with Multiple Containers"
   ./TOSCA-WFDS/WF-deploy.sh 1
else
   echo "NJ deployment with Single Container"
   ./TOSCA-WFDS/WF-deploy.sh 2
fi

