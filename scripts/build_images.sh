#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

PACKER=/usr/local/bin/packer
BUILDER=/vagrant/builder

build_ubuntu-14.04-lamp-php5.5 () {
	cd $BUILDER/14.04-php5.5
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp and proboci/ubuntu-14.04-lamp:beta images...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp" -t="proboci/ubuntu-14.04-lamp:beta" .
	echo -e "${INFO}Images for proboci/ubuntu-14.04-lamp and proboci/ubuntu-14.04-lamp:betabuilt.${NC}"
}

build_ubuntu-14.04-lamp-php5.6 () {
	cd $BUILDER/14.04-php5.6
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-5.6 and proboci/ubuntu-14.04-lamp:5.6-beta images...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-5.6" -t="proboci/ubuntu-14.04-lamp:5.6-beta" .
	echo -e "${INFO}Images for proboci/ubuntu-14.04-lamp:php-5.6 and proboci/ubuntu-14.04-lamp:5.6-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php7.0 () {
	cd $BUILDER/14.04-php7.0
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.0 and proboci/ubuntu-14.04-lamp:7.0-beta images...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.0" -t="proboci/ubuntu-14.04-lamp:7.0-beta" .
	echo -e "${INFO}Images for proboci/ubuntu-14.04-lamp:php-7.0 and proboci/ubuntu-14.04-lamp:7.0-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php7.1 () {
	cd $BUILDER/14.04-php7.1
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.1 and proboci/ubuntu-14.04-lamp:7.1-beta images...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.1" -t="proboci/ubuntu-14.04-lamp:7.1-beta" .
	echo -e "${INFO}Images for proboci/ubuntu-14.04-lamp:php-7.1 and proboci/ubuntu-14.04-lamp:7.1-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php7.2 () {
	cd $BUILDER/14.04-php7.2
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.2 and proboci/ubuntu-14.04-lamp:php-7.2-beta images...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.2" -t="proboci/ubuntu-14.04-lamp:php-7.2-beta" .
	echo -e "${INFO}Images for proboci/ubuntu-14.04-lamp:php-7.2 and proboci/ubuntu-14.04-lamp:php-7.2-beta built.${NC}"
}

build_ubuntu-16.04-dotnet-sdk1.0.1 () {
	cd $BUILDER/16.04-dotnetsdk1.0.1
	$PACKER build ubuntu-16.04-dotnet.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly built.${NC}"
}

build_ubuntu-16.04-dotnet-sdk2.0.2 () {
	cd $BUILDER/16.04-dotnetsdk2.0.2
	$PACKER build ubuntu-16.04-dotnet.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly built.${NC}"
}

build_ubuntu-16.04-lamp-php7.0 () {
	cd $BUILDER/16.04-php7.0
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.0...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.0" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.0 built.${NC}"
}

build_ubuntu-16.04-lamp-php7.1 () {
	cd $BUILDER/16.04-php7.1
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.1...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.1" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.1 built.${NC}"
}

build_ubuntu-16.04-lamp-php7.2 () {
	cd $BUILDER/16.04-php7.2
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.2...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.2" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.2 built.${NC}"
}

# Build LAMP images.
build_ubuntu-14.04-lamp-php5.5
build_ubuntu-14.04-lamp-php5.6
build_ubuntu-14.04-lamp-php7.0
build_ubuntu-14.04-lamp-php7.1
build_ubuntu-14.04-lamp-php7.2
build_ubuntu-16.04-lamp-php7.0
build_ubuntu-16.04-lamp-php7.1
build_ubuntu-16.04-lamp-php7.2

# Build .NET images.
#build_ubuntu-16.04-dotnet-sdk1.0.1
#build_ubuntu-16.04-dotnet-sdk2.0.2
