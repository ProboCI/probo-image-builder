#!/usr/bin/env bash

INFO='\033[0;34m'
NC='\033[0m' # No Color

WORKSPACE=/vagrant/workspace

rm -f $WORKSPACE/*

export_ubuntu-14.04-lamp-php-5.5 () {
	docker save proboci/ubuntu-14.04-lamp:latest > $WORKSPACE/ubuntu-14.04-lamp-latest.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-latest.tar
}

export_ubuntu-14.04-lamp-php5.5-beta () {
	docker save proboci/ubuntu-14.04-lamp:beta > $WORKSPACE/ubuntu-14.04-lamp-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-beta.tar
}

export_ubuntu-14.04-lamp-php-5.6 () {
	docker save proboci/ubuntu-14.04-lamp:php-5.6 > $WORKSPACE/ubuntu-14.04-lamp-php-5.6.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-php-5.6.tar
}

export_ubuntu-14.04-lamp-php5.6-beta () {
	docker save proboci/ubuntu-14.04-lamp:5.6-beta > $WORKSPACE/ubuntu-14.04-lamp-php5.6-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php5.6.tar
}

export_ubuntu-14.04-lamp-php-7.0 () {
	docker save proboci/ubuntu-14.04-lamp:php-7.0 > $WORKSPACE/ubuntu-14.04-lamp-php-7.0.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-php-7.0.tar
}

export_ubuntu-14.04-lamp-php7.0-beta () {
	docker save proboci/ubuntu-14.04-lamp:7.0-beta > $WORKSPACE/ubuntu-14.04-php7.0-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.0-beta.tar
}

export_ubuntu-14.04-lamp-php-7.1 () {
	docker save proboci/ubuntu-14.04-lamp:php-7.1 > $WORKSPACE/ubuntu-14.04-lamp-php-7.1.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-php-7.1.tar
}

export_ubuntu-14.04-lamp-php7.1-beta () {
	docker save proboci/ubuntu-14.04-lamp:7.1-beta > $WORKSPACE/ubuntu-14.04-php7.1-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.1-beta.tar
}

export_ubuntu-14.04-lamp-php-7.2 () {
	docker save proboci/ubuntu-14.04-lamp:php-7.2 > $WORKSPACE/ubuntu-14.04-lamp-php-7.2.tar
	gzip $WORKSPACE/ubuntu-14.04-lamp-php-7.2.tar
}

export_ubuntu-14.04-lamp-php7.2-beta () {
	docker save proboci/ubuntu-14.04-lamp:7.2-beta > $WORKSPACE/ubuntu-14.04-php7.2-beta.tar
	gzip $WORKSPACE/ubuntu-14.04-php7.2-beta.tar
}

export_ubuntu-16.04-dotnet-sdk1.0.1 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk1.0.1 > $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1.tar
}

export_ubuntu-16.04-dotnet-sdk2.0.2 () {
	docker save proboci/ubuntu-16.04-dotnet:sdk2.0.2 > $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2.tar
	gzip $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2.tar
}

export_ubuntu-16.04-lamp-php-7.0 () {
	docker save proboci/ubuntu-16.04-lamp:php-7.0 > $WORKSPACE/ubuntu-16.04-lamp-php-7.0.tar
	gzip $WORKSPACE/ubuntu-16.04-lamp-php-7.0.tar
}

export_ubuntu-16.04-lamp-php7.0-beta () {
	docker save proboci/ubuntu-16.04-lamp:7.0-beta > $WORKSPACE/ubuntu-16.04-php7.0-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.0-beta.tar
}

export_ubuntu-16.04-lamp-php-7.1 () {
	docker save proboci/ubuntu-16.04-lamp:php-7.1 > $WORKSPACE/ubuntu-16.04-lamp-php-7.1.tar
	gzip $WORKSPACE/ubuntu-16.04-lamp-php-7.1.tar
}

export_ubuntu-16.04-lamp-php7.1-beta () {
	docker save proboci/ubuntu-16.04-lamp:7.1-beta > $WORKSPACE/ubuntu-16.04-php7.1-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.1-beta.tar
}

export_ubuntu-16.04-lamp-php-7.2 () {
	docker save proboci/ubuntu-16.04-lamp:php-7.2 > $WORKSPACE/ubuntu-16.04-lamp-php-7.2.tar
	gzip $WORKSPACE/ubuntu-16.04-lamp-php-7.2.tar
}

export_ubuntu-16.04-lamp-php7.2-beta () {
	docker save proboci/ubuntu-16.04-lamp:7.2-beta > $WORKSPACE/ubuntu-16.04-php7.2-beta.tar
	gzip $WORKSPACE/ubuntu-16.04-php7.2-beta.tar
}

export_ubuntu-14.04-beta-images (){
	# Export Ubuntu LAMP 14.04 PHP Beta Images
	export_ubuntu-14.04-lamp-php5.5-beta
	export_ubuntu-14.04-lamp-php5.6-beta
	export_ubuntu-14.04-lamp-php7.0-beta
	export_ubuntu-14.04-lamp-php7.1-beta
	#export_ubuntu-14.04-lamp-php7.2-beta
}

export_ubuntu-14.04-stable-images () {
	# Export Ubuntu LAMP 14.04 PHP Stable Images
	export_ubuntu-14.04-lamp-php-5.5
	export_ubuntu-14.04-lamp-php-5.6
	export_ubuntu-14.04-lamp-php-7.0
	export_ubuntu-14.04-lamp-php-7.1
	#export_ubuntu-14.04-lamp-php-7.2

}

export_ubuntu-16.04-beta-images () {
	# Export Ubuntu LAMP 16.04 PHP Beta Images
	export_ubuntu-16.04-lamp-php7.0-beta
	export_ubuntu-16.04-lamp-php7.1-beta
	export_ubuntu-16.04-lamp-php7.2-beta
}

export_ubuntu-16.04-stable-images () {
	# Ubuntu LAMP 16.04 PHP Images
	export_ubuntu-16.04-lamp-php-7.0
	export_ubuntu-16.04-lamp-php-7.1
	export_ubuntu-16.04-lamp-php-7.2
}


export_dotnet-core-images () {
	# Export .NET Core images.
	export_ubuntu-16.04-dotnet-sdk1.0.1
	export_ubuntu-16.04-dotnet-sdk2.0.2
}

#export_ubuntu-14.04-beta-images
export_ubuntu-14.04-stable-images
#export_ubuntu-16.04-beta-images
export_ubuntu-16.04-stable-images
#export_dotnet-core-images
