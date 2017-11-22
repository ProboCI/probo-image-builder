#!/usr/bin/env bash

# This script will remove all existing local containers, images, and vagrant VMs and rebuild the nightly images.
# It will then import those images to the docker installation on the local machine.

exit_status=$?
INFO='\033[0;34m'
ERROR='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
RUNNING=$("docker container ls | grep proboci" 2> /dev/null)

if [ ! $? -eq 0 ]; then
    echo -e "${INFO}No containers exist. Moving on.${NC}"
else
  echo -e "${INFO}Deleting old containers...${NC}"
  docker rm -f $(docker ps -aq)
  echo -e "${INFO}Old containers have been deleted.${NC}"
fi

RUNNING=$("docker images | grep proboci" 2> /dev/null)

if [ ! $? -eq 0 ]; then
    echo -e "${INFO}No images exist. Moving on."
else
  echo -e "${INFO}Deleting old images...${NC}"
  docker rmi -f $(docker images -q)
  echo -e "${INFO}Old images have been deleted.${NC}"
fi

echo -e "${INFO}Running vagrant destroy to clean up VM from previous run.${NC}"
vagrant destroy --force
echo -e "${INFO}Old vagrant VM destroyed.${NC}"

echo -e "${INFO}Updating vagrant box file.${NC}"
vagrant box update

echo -e "${INFO}Running vagrant up to build VM and save nightly docker images.${NC}"
vagrant up

RUNNING=$("docker" 2> /dev/null)

if [ ! $? -eq 0 ]; then
  echo -e "${ERROR}Docker not installed. Please install docker. https://www.docker.com/${NC}"
  exit 1
else
  echo -e "${INFO}Loading nightly docker images into docker on local machine.${NC}"
  scripts/load-docker-images.sh
fi

echo -e "${GREEN}The docker image should be ready to push to the docker hub now.${NC}"
