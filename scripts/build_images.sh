#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

PACKER=/usr/local/bin/packer
BUILDER=/vagrant/builder

build_ubuntu-14.04-lamp-php5.5 () {
	cd $BUILDER/14.04-php5.5
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:latest" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:latest built.${NC}"
}

build_ubuntu-14.04-lamp-php5.5-beta () {
	cd $BUILDER/14.04-php5.5
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-5.6 () {
	cd $BUILDER/14.04-php5.6
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-5.6 image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-5.6" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-5.6 built.${NC}"
}

build_ubuntu-14.04-lamp-php5.6-beta () {
	cd $BUILDER/14.04-php5.6
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:5.6-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:5.6-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:5.6-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-7.0 () {
	cd $BUILDER/14.04-php7.0
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.0 image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.0" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.0 built.${NC}"
}

build_ubuntu-14.04-lamp-php7.0-beta () {
	cd $BUILDER/14.04-php7.0
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:7.0-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:7.0-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:7.0-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-7.1 () {
	cd $BUILDER/14.04-php7.1
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.1 image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.1" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.1 built.${NC}"
}

build_ubuntu-14.04-lamp-php7.1-beta () {
	cd $BUILDER/14.04-php7.1
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:7.1-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:7.1-beta" .
	echo -e "${INFO}Image roboci/ubuntu-14.04-lamp:7.1-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-7.2 () {
	cd $BUILDER/14.04-php7.2
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.2 image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.2" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.2 built.${NC}"
}

build_ubuntu-14.04-lamp-php7.2-beta () {
	cd $BUILDER/14.04-php7.2
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.2-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.2-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.2-beta built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.0 () {
	cd $BUILDER/16.04-php7.0
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.0 image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.0" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.0 built.${NC}"
}

build_ubuntu-16.04-lamp-php7.0-beta () {
	cd $BUILDER/16.04-php7.0
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:7.0-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:7.0-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:7.0-beta built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.1 () {
	cd $BUILDER/16.04-php7.1
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.1 image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.1" .
	echo -e "${INFO}Images for proboci/ubuntu-16.04-lamp:php-7.1 built.${NC}"
}

build_ubuntu-16.04-lamp-php7.1-beta () {
	cd $BUILDER/16.04-php7.1
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:7.1-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:7.1-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:7.1-beta built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.2 () {
	cd $BUILDER/16.04-php7.2
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.2 image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.2" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.2 built.${NC}"
}

build_ubuntu-16.04-lamp-php7.2-beta () {
	cd $BUILDER/16.04-php7.2
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:7.2-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:7.2-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:7.2-beta built.${NC}"
}

build_ubuntu-16.04-dotnet-sdk1.0.1 () {
	cd $BUILDER/16.04-dotnetsdk1.0.1
	$PACKER build ubuntu-16.04-dotnet.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk1.0.1...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk1.0.1" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk1.0.1 built.${NC}"
}

build_ubuntu-16.04-dotnet-sdk2.0.2 () {
	cd $BUILDER/16.04-dotnetsdk2.0.2
	$PACKER build ubuntu-16.04-dotnet.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-dotnet:sdk2.0.2...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-dotnet:sdk2.0.2" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-dotnet:sdk2.0.2 built.${NC}"
}

build_ubuntu-14.04-beta-images () {
	# Build Ubuntu LAMP 14.04 PHP Beta Images
	build_ubuntu-14.04-lamp-php5.5-beta
	build_ubuntu-14.04-lamp-php5.6-beta
	build_ubuntu-14.04-lamp-php7.0-beta
	build_ubuntu-14.04-lamp-php7.1-beta
	build_ubuntu-14.04-lamp-php7.2-beta
}

build_ubuntu-14.04-stable-images () {
	# Build Ubuntu LAMP 14.04 PHP Stable Images
	build_ubuntu-14.04-lamp-php-5.5
	build_ubuntu-14.04-lamp-php-5.6
	build_ubuntu-14.04-lamp-php-7.0
	build_ubuntu-14.04-lamp-php-7.1
	build_ubuntu-14.04-lamp-php-7.2
}

build_ubuntu-16.04-beta-images () {
	# Build Ubuntu LAMP 16.04 PHP Beta Images
	build_ubuntu-16.04-lamp-php7.0-beta
	build_ubuntu-16.04-lamp-php7.1-beta
	build_ubuntu-16.04-lamp-php7.2-beta
}

build_ubuntu-16.04-stable-images () {
	# Build Ubuntu LAMP 16.04 PHP Stable Images
	build_ubuntu-16.04-lamp-php-7.0
	build_ubuntu-16.04-lamp-php-7.1
	build_ubuntu-16.04-lamp-php-7.2
}

build_dotnet-core-images () {
	# Build .NET images.
	build_ubuntu-16.04-dotnet-sdk1.0.1
	build_ubuntu-16.04-dotnet-sdk2.0.2
}

#build_ubuntu-14.04-beta-images
build_ubuntu-14.04-stable-images
#build_ubuntu-16.04-beta-images
build_ubuntu-16.04-stable-images
#build_dotnet-core-images
