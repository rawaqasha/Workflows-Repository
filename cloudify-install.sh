#!/bin/bash

sudo apt-get update

sudo apt-get install -y python-pip python-dev python-virtualenv

virtualenv ~/virt-env

. ~/virt-env/bin/activate

pip install cloudify==3.1
