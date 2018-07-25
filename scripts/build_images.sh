#!/usr/bin/env bash

# This script builds beta Probo docker images for the docker hub that can be tested for a stable release.
# Stable image tags will be tagged from the existing beta image that has been tested and then pushed to the docker hub.
# The :latest tagged images are built separately, as they will now be the most bleeding edge releases.

# All image build functions are commented at the bottom of this file by default.
# Uncomment the builds you want to run, otherwise the provisioning takes forever.
# **Note:** Make sure to uncomment the corresponding export functions in the export_images.sh file.

INFO='\033[0;34m'
NC='\033[0m' # No Color

PACKER=/usr/local/bin/packer
BUILDER=/vagrant/builder

build_ubuntu-14.04-lamp-php-5.5-beta () {
	cd $BUILDER/14.04-php-5.5
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-5.5-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-5.5-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-5.5-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-5.6-beta () {
	cd $BUILDER/14.04-php-5.6
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-5.6-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-5.6-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-5.6-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-7.0-beta () {
	cd $BUILDER/14.04-php-7.0
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.0-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.0-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.0-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php-7.1-beta () {
	cd $BUILDER/14.04-php-7.1
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.1-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.1-beta" .
	echo -e "${INFO}Image roboci/ubuntu-14.04-lamp:php-7.1-beta built.${NC}"
}

build_ubuntu-14.04-lamp-php7.2-beta () {
	cd $BUILDER/14.04-php-7.2
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:php-7.2-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:php-7.2-beta" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:php-7.2-beta built.${NC}"
}

build_ubuntu-14.04-lamp-latest () {
	cd $BUILDER/14.04-latest
	$PACKER build ubuntu-14.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-14.04-lamp:latest image...${NC}"
	docker build --compress -t="proboci/ubuntu-14.04-lamp:latest" .
	echo -e "${INFO}Image proboci/ubuntu-14.04-lamp:latest built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.0-beta () {
	cd $BUILDER/16.04-php-7.0
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.0-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.0-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.0-beta built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.1-beta () {
	cd $BUILDER/16.04-php-7.1
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.1-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.1-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.1-beta built.${NC}"
}

build_ubuntu-16.04-lamp-php-7.2-beta () {
	cd $BUILDER/16.04-php-7.2
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:php-7.2-beta image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:php-7.2-beta" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:php-7.2-beta built.${NC}"
}

build_ubuntu-16.04-lamp-latest () {
	cd $BUILDER/16.04-latest
	$PACKER build ubuntu-16.04-lamp.json
	echo -e "${INFO}Building proboci/ubuntu-16.04-lamp:latest image...${NC}"
	docker build --compress -t="proboci/ubuntu-16.04-lamp:latest" .
	echo -e "${INFO}Image proboci/ubuntu-16.04-lamp:latest built.${NC}"
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

build_ubuntu-lamp-latest-images () {
	build_ubuntu-16.04-lamp-latest
	build_ubuntu-14.04-lamp-latest
}

build_ubuntu-14.04-beta-images () {
	# Build Ubuntu LAMP 14.04 PHP Beta Images
	build_ubuntu-14.04-lamp-php-5.5-beta
	build_ubuntu-14.04-lamp-php-5.6-beta
	build_ubuntu-14.04-lamp-php-7.0-beta
	build_ubuntu-14.04-lamp-php-7.1-beta
	build_ubuntu-14.04-lamp-php-7.2-beta
}

build_ubuntu-16.04-beta-images () {
	# Build Ubuntu LAMP 16.04 PHP Beta Images
	build_ubuntu-16.04-lamp-php-7.0-beta
	build_ubuntu-16.04-lamp-php-7.1-beta
	build_ubuntu-16.04-lamp-php-7.2-beta
}

build_dotnet-core-images () {
	# Build .NET images.
	build_ubuntu-16.04-dotnet-sdk1.0.1
	build_ubuntu-16.04-dotnet-sdk2.0.2
}

build_ubuntu-lamp-php-5-beta-images () {
	# Build Ubuntu LAMP PHP 5 Beta Images
	build_ubuntu-14.04-lamp-php-5.5-beta
	build_ubuntu-14.04-lamp-php-5.6-beta
}

build_ubuntu-lamp-php-7.0-beta-images () {
	# Build Ubuntu LAMP PHP 7.0 Beta Images
	build_ubuntu-14.04-lamp-php-7.0-beta
	build_ubuntu-16.04-lamp-php-7.0-beta
}

build_ubuntu-lamp-php-7.1-beta-images () {
	# Build Ubuntu LAMP PHP 7.1 Beta Images
	build_ubuntu-14.04-lamp-php-7.1-beta
	build_ubuntu-16.04-lamp-php-7.1-beta
}

build_ubuntu-lamp-php-7.2-beta-images () {
	# Build Ubuntu LAMP PHP 7.2 Beta Images
	build_ubuntu-14.04-lamp-php-7.2-beta
	build_ubuntu-16.04-lamp-php-7.2-beta
}

# Build the :latest tags for both the 14.04 and 16.04 docker images.
#build_ubuntu-lamp-latest-images

# Build the :beta tags for both the 14.04 and 16.04 docker images.
#build_ubuntu-14.04-beta-images
#build_ubuntu-14.04-lamp-php-5.5-beta
build_ubuntu-14.04-lamp-php-5.6-beta
#build_ubuntu-14.04-lamp-php-7.0-beta
#build_ubuntu-14.04-lamp-php-7.1-beta
#build_ubuntu-14.04-lamp-php-7.2-beta

#build_ubuntu-16.04-beta-images
#build_ubuntu-16.04-lamp-php-7.0-beta
#build_ubuntu-16.04-lamp-php-7.1-beta
#build_ubuntu-16.04-lamp-php-7.2-beta

# Build the PHP 5 beta images.
#build_ubuntu-lamp-php-5-beta-images

# Build the PHP 7.0 beta images.
#build_ubuntu-lamp-php-7.0-beta-images

# Build the PHP 7.1 beta images.
#build_ubuntu-lamp-php-7.1-beta-images

# Build the PHP 7.2 beta images.
#build_ubuntu-lamp-php-7.2-beta-images

# Build the dotnet core images.
#build_dotnet-core-images
