#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

WORKSPACE=/vagrant/workspace

rm -f $WORKSPACE/*

export_ubuntu-14.04-lamp-php5.6 () {
	docker save proboci/ubuntu-14.04-lamp:php5.6-nightly > $WORKSPACE/ubuntu-14.04-php5.6-nightly.tar
	gzip $WORKSPACE/ubuntu-14.04-php5.6-nightly.tar
}

export_ubuntu-14.04-lamp-php7.0 () {
	docker save proboci/ubuntu-14.04-lamp:php7.0-nightly > $WORKSPACE/ubuntu-14.04-php7.0-nightly.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.0-nightly.tar
}

export_ubuntu-14.04-lamp-php7.1 () {
	docker save proboci/ubuntu-14.04-lamp:php7.1-nightly > $WORKSPACE/ubuntu-14.04-php7.1-nightly.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.1-nightly.tar
}

export_ubuntu-14.04-lamp-php7.2 () {
	docker save proboci/ubuntu-14.04-lamp:php7.2-nightly > $WORKSPACE/ubuntu-14.04-php7.2-nightly.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.2-nightly.tar
}

export_ubuntu-16.04-dotnet-sdk1.0.1 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly > $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1-nightly.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1-nightly.tar
}

export_ubuntu-16.04-dotnet-sdk2.0.2 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly > $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2-nightly.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2-nightly.tar
}

export_ubuntu-16.04-lamp-php7.0 () {
	docker save proboci/ubuntu-16.04-lamp:php7.0-nightly > $WORKSPACE/ubuntu-16.04-php7.0-nightly.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.0-nightly.tar
}

export_ubuntu-16.04-lamp-php7.1 () {
	docker save proboci/ubuntu-16.04-lamp:php7.1-nightly > $WORKSPACE/ubuntu-16.04-php7.1-nightly.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.1-nightly.tar
}

export_ubuntu-16.04-lamp-php7.2 () {
	docker save proboci/ubuntu-16.04-lamp:php7.2-nightly > $WORKSPACE/ubuntu-16.04-php7.2-nightly.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.2-nightly.tar
}

# Export LAMP images.
#export_ubuntu-14.04-lamp-php5.6
#export_ubuntu-14.04-lamp-php7.0
export_ubuntu-14.04-lamp-php7.1
#export_ubuntu-16.04-lamp-php7.0
#export_ubuntu-16.04-lamp-php7.1
#export_ubuntu-16.04-lamp-php7.2

# Export .NET images.
#export_ubuntu-16.04-dotnet-sdk1.0.1
#export_ubuntu-16.04-dotnet-sdk2.0.2
