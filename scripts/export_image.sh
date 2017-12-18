#!/usr/bin/env bash

WORKSPACE=/vagrant/workspace

rm -f $WORKSPACE/*

#docker save proboci/ubuntu-14.04-lamp:php5.6-nightly > $WORKSPACE/ubuntu-14.04-php5.6-nightly.tar
#gzip $WORKSPACE/ubuntu-14.04-php5.6-nightly.tar

#docker save proboci/ubuntu-14.04-lamp:php7.0-nightly > $WORKSPACE/ubuntu-14.04-php7.0-nightly.tar
#gzip $WORKSPACE/ubuntu-14.04-php7.0-nightly.tar

#docker save proboci/ubuntu-14.04-lamp:php7.1-nightly > $WORKSPACE/ubuntu-14.04-php7.1-nightly.tar
#gzip $WORKSPACE/ubuntu-14.04-php7.1-nightly.tar

#docker save proboci/ubuntu-14.04-lamp:php7.2-nightly > $WORKSPACE/ubuntu-14.04-php7.2-nightly.tar
#gzip $WORKSPACE/ubuntu-14.04-php7.2-nightly.tar

docker save proboci/ubuntu-16.04-dotnet:sdk1.0.1-nightly > $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1-nightly.tar
gzip $WORKSPACE/ubuntu-16.04-dotnetsdk1.0.1-nightly.tar

docker save proboci/ubuntu-16.04-dotnet:sdk2.0.2-nightly > $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2-nightly.tar
gzip $WORKSPACE/ubuntu-16.04-dotnetsdk2.0.2-nightly.tar

#docker save proboci/ubuntu-16.04-lamp:php7.0-nightly > $WORKSPACE/ubuntu-16.04-php7.0-nightly.tar
#gzip $WORKSPACE/ubuntu-16.04-php7.0-nightly.tar

#docker save proboci/ubuntu-16.04-lamp:php7.1-nightly > $WORKSPACE/ubuntu-16.04-php7.1-nightly.tar
#gzip $WORKSPACE/ubuntu-16.04-php7.1-nightly.tar

#docker save proboci/ubuntu-16.04-lamp:php7.2-nightly > $WORKSPACE/ubuntu-16.04-php7.2-nightly.tar
#gzip $WORKSPACE/ubuntu-16.04-php7.2-nightly.tar
