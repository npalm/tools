#!/bin/bash 

current=`pwd`
export basedir=${current}/`dirname $0`
export defaultuser=$(whoami)

sudo apt-get update && apt-get upgrade -y
sudo apt-get install joe git curl -y

sudo locale-gen en_US en_US.UTF-8 nl_NL nl_NL.UTF-8
sudo dpkg-reconfigure locales 

sudo -E ${basedir}/docker.sh
