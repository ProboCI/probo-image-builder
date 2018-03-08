#!/usr/bin/env bash

# This script exports beta Probo docker images for the docker hub that can be tested for a stable release.
# Stable image tags will be tagged from the existing beta image that has been tested and then pushed to the docker hub.
# The :latest tagged images are exported separately, as they will now be the most bleeding edge releases.

# All image export functions are commented at the bottom of this file by default.
# Uncomment the exports you want to run, otherwise the provisioning takes forever.
# **Note:** Make sure to uncomment the corresponding build functions in the build_images.sh file.

INFO='\033[0;34m'
NC='\033[0m' # No Color

WORKSPACE=/vagrant/workspace

rm -f $WORKSPACE/*

export_ubuntu-14.04-lamp-latest () {
	docker save proboci/ubuntu-14.04-lamp:latest > $WORKSPACE/ubuntu-14.04-lamp-latest.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-latest.tar
}

export_ubuntu-14.04-lamp-php-5.5-beta () {
	docker save proboci/ubuntu-14.04-lamp:php-5.5-beta > $WORKSPACE/ubuntu-14.04-lamp-php-5.5-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-beta.tar
}

export_ubuntu-14.04-lamp-php-5.6-beta () {
	docker save proboci/ubuntu-14.04-lamp:php-5.6-beta > $WORKSPACE/ubuntu-14.04-lamp-php-5.6-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php-5.6.tar
}

export_ubuntu-14.04-lamp-php-7.0-beta () {
	docker save proboci/ubuntu-14.04-lamp:php-7.0-beta > $WORKSPACE/ubuntu-14.04-php-7.0-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php-7.0-beta.tar
}

export_ubuntu-14.04-lamp-php-7.1-beta () {
	docker save proboci/ubuntu-14.04-lamp:php-7.1-beta > $WORKSPACE/ubuntu-14.04-php-7.1-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php-7.1-beta.tar
}

export_ubuntu-14.04-lamp-php-7.2-beta () {
	docker save proboci/ubuntu-14.04-lamp:php-7.2-beta > $WORKSPACE/ubuntu-14.04-php-7.2-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php-7.2-beta.tar
}

export_ubuntu-16.04-dotnet-sdk1.0.1 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk1.0.1 > $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1.tar
}

export_ubuntu-16.04-dotnet-sdk2.0.2 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk2.0.2 > $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2.tar
}

export_ubuntu-16.04-lamp-php-7.0-beta () {
	docker save proboci/ubuntu-16.04-lamp:php-7.0-beta > $WORKSPACE/ubuntu-16.04-php-7.0-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php-7.0-beta.tar
}

export_ubuntu-16.04-lamp-php-7.1-beta () {
	docker save proboci/ubuntu-16.04-lamp:php-7.1-beta > $WORKSPACE/ubuntu-16.04-php-7.1-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php-7.1-beta.tar
}

export_ubuntu-16.04-lamp-php-7.2-beta () {
	docker save proboci/ubuntu-16.04-lamp:php-7.2-beta > $WORKSPACE/ubuntu-16.04-php-7.2-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php-7.2-beta.tar
}

export_ubuntu-16.04-lamp-latest () {
	docker save proboci/ubuntu-16.04-lamp:latest > $WORKSPACE/ubuntu-16.04-lamp-latest.tar
	gzip $WORKSPACE/ubuntu-16.04-lamp-latest.tar
}

export_ubuntu-lamp-latest-images () {
	export_ubuntu-14.04-lamp-latest
	export_ubuntu-16.04-lamp-latest
}

export_ubuntu-14.04-beta-images () {
	# Export Ubuntu LAMP 14.04 PHP Beta Images
	export_ubuntu-14.04-lamp-php-5.5-beta
	export_ubuntu-14.04-lamp-php-5.6-beta
	export_ubuntu-14.04-lamp-php-7.0-beta
	export_ubuntu-14.04-lamp-php-7.1-beta
	export_ubuntu-14.04-lamp-php-7.2-beta
}

export_ubuntu-16.04-beta-images () {
	# Export Ubuntu LAMP 16.04 PHP Beta Images
	export_ubuntu-16.04-lamp-php-7.0-beta
	export_ubuntu-16.04-lamp-php-7.1-beta
	export_ubuntu-16.04-lamp-php-7.2-beta
}

export_dotnet-core-images () {
	# Export .NET Core images.
	export_ubuntu-16.04-dotnet-sdk1.0.1
	export_ubuntu-16.04-dotnet-sdk2.0.2
}

export_ubuntu-lamp-php-5-beta-images () {
	# Export Ubuntu LAMP PHP 5 Beta Images
	export_ubuntu-14.04-lamp-php-5.5-beta
	export_ubuntu-14.04-lamp-php-5.6-beta
}

export_ubuntu-lamp-php-7.0-beta-images () {
	# Export Ubuntu LAMP PHP 7.0 Beta Images
	export_ubuntu-14.04-lamp-php-7.0-beta
	export_ubuntu-16.04-lamp-php-7.0-beta
}

export_ubuntu-lamp-php-7.1-beta-images () {
	# Export Ubuntu LAMP PHP 7.1 Beta Images
	export_ubuntu-14.04-lamp-php-7.1-beta
	export_ubuntu-16.04-lamp-php-7.1-beta
}

export_ubuntu-lamp-php-7.2-beta-images () {
	# Export Ubuntu LAMP PHP 7.2 Beta Images
	export_ubuntu-14.04-lamp-php-7.2-beta
	export_ubuntu-16.04-lamp-php-7.2-beta
}

# Export the :latest tags for both the 14.04 and 16.04 docker images.
#export_ubuntu-lamp-latest-images

# Export the :beta tags for both the 14.04 and 16.04 docker images.
#export_ubuntu-14.04-beta-images
#export_ubuntu-16.04-beta-images

# Export the PHP 5 beta images.
#export_ubuntu-lamp-php-5-beta-images

# Export the PHP 7.0 beta images.
#export_ubuntu-lamp-php-7.0-beta-images

# Export the PHP 7.1 beta images.
#export_ubuntu-lamp-php-7.1-beta-images

# Export the PHP 7.2 beta images.
#export_ubuntu-lamp-php-7.2-beta-images

# Export the dotnet core images.
#export_dotnet-core-images
