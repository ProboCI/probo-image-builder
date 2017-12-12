#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

PACKER=/usr/local/bin/packer
BUILDER=/vagrant/builder

cd $BUILDER/14.04-php5.6
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php5.6-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php5.6-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php5.6-nightly built.${NC}"

cd $BUILDER/14.04-php7.0
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.0-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.0-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.0-nightly built.${NC}"

cd $BUILDER/14.04-php7.1
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.1-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.1-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.1-nightly built.${NC}"

cd $BUILDER/14.04-php7.2
$PACKER build ubuntu-14.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php7.2-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-14.04-lamp:php7.2-nightly" .
echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php7.2-nightly built.${NC}"

cd $BUILDER/16.04-dotnetsdk1.0.1
$PACKER build ubuntu-16.04-dotnet.json
echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly built.${NC}"

cd $BUILDER/16.04-dotnetsdk2.0.2
$PACKER build ubuntu-16.04-dotnet.json
echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly built.${NC}"

cd $BUILDER/16.04-php7.0
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.0-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.0-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.0-nightly built.${NC}"

cd $BUILDER/16.04-php7.1
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.1-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.1-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.1-nightly built.${NC}"

cd $BUILDER/16.04-php7.2
$PACKER build ubuntu-16.04-lamp.json
echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php7.2-nightly...${NC}"
docker build --compress -t="proboci/ubuntu-16.04-lamp:php7.2-nightly" .
echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php7.2-nightly built.${NC}"
