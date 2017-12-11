#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

PACKER=/usr/local/bin/packer

cd /vagrant/builder/14.04-php5.6
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php5.6-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php5.6-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php5.6-nightly built.${NC}"

cd ../14.04-php7.0
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.0-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.0-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.0-nightly built.${NC}"

cd ../14.04-php7.1
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.1-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.1-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.1-nightly built.${NC}"

cd ../14.04-php7.2
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.2-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.2-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.2-nightly built.${NC}"

cd ../16.04-php7.0
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.0-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.0-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.0-nightly built.${NC}"

cd ../16.04-php7.1
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.1-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.1-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.1-nightly built.${NC}"

cd ../16.04-php7.2
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.2-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.2-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.2-nightly built.${NC}"
