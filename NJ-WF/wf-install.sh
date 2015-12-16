if [ ! -d TOSCA-WFDS]; then
   mkdir TOSCA-WFDS
fi

# docker installation
docker=which docker

if [[ -z ${docker} ]]; then
   if [ ! -f TSCA-WFDS/docker-installation.sh ]; then
      wget -O TOSCA-WFDS/docker-installation.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/docker-  installation.sh
   chmod u+x /workflow/docker-installation.sh
   fi
   #./TOSCA-WFDS/docker-installation.sh
fi

#Cloudify configuration and installation
cloudify= which cfy

if [[ -z ${cloudify} ]]; then
   wget -O TOSCA-WFDS/cloudify-install.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/cloudify-install.sh
   chmod u+x /TOSCA-WFDS/cloudify-install.sh
   . ./TOSCA-WFDS/cloudify-install.sh
fi


#workflow deployment
wget -O workflow/WF-deploy.sh https://github.com/rawaqasha/Workflows-Repository/raw/master/NJ-WF/WF-deploy.sh
chmod u+x /workflow/WF-deploy.sh
./workflow/WF-deploy.sh