#!/bin/bash

echo "unzip Workflow"

tar -zxvf NJ.tar.gz

sudo service docker start

echo "deploy the workflow"
cd  NJ

cfy local init --install-plugins -p realeScWF-inhost.yaml

cfy local execute -w install
