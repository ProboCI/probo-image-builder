#!/usr/bin/env bash

workspace=/vagrant/workspace
1404-lamp=proboci/ubuntu-14.04-lamp
1604-lamp=proboci/ubuntu-16.04-lamp

rm -f $workspace/*
docker save $1404-lamp:php5.6-nightly > $workspace/ubuntu-14.04-php5.6-nightly.tar
gzip $workspace/ubuntu-14.04-php5.6-nightly.tar
docker save $1404-lamp:php7.0-nightly > $workspace/ubuntu-14.04-php7.0-nightly.tar
gzip $workspace/ubuntu-14.04-php7.0-nightly.tar
docker save 1404-lamp:php7.1-nightly > $workspace/ubuntu-14.04-php7.1-nightly.tar
gzip $workspace/ubuntu-14.04-php7.1-nightly.tar
docker save $1604-lamp:php7.0-nightly > $workspace/ubuntu-16.04-php7.0-nightly.tar
gzip $workspace/ubuntu-16.04-php7.0-nightly.tar
docker save $1604-lamp:php7.1-nightly > $workspace/ubuntu-16.04-php7.1-nightly.tar
gzip $workspace/ubuntu-16.04-php7.1-nightly.tar
docker save $1604-lamp:php7.2-nightly > $workspace/ubuntu-16.04-php7.2-nightly.tar
gzip $workspace/ubuntu-16.04-php7.2-nightly.tar
