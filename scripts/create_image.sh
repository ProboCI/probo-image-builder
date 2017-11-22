#!/usr/bin/env bash
packer=/usr/local/bin/packer
1404-lamp=proboci/ubuntu-14.04-lamp
1604-lamp=proboci/ubuntu-16.04-lamp

cd /vagrant/builder/14.04-php5.6
$packer build ubuntu-14.04-lamp.json
docker build -t="$1404-lamp:php5.6-nightly" .

cd ../14.04-php7.0
$packer build ubuntu-14.04-lamp.json
docker build -t="$1404-lamp:php7.0-nightly" .

cd ../14.04-php7.1
$packer build ubuntu-14.04-lamp.json
docker build -t="$1404-lamp:php7.1-nightly" .

cd ../16.04-php7.0
$packer build ubuntu-16.04-lamp.json
docker build -t="$1604-lamp:php7.0-nightly" .

cd ../16.04-php7.1
$packer build ubuntu-16.04-lamp.json
docker build -t="$1604-lamp:php7.1-nightly" .

cd ../16.04-php7.2
$packer build ubuntu-16.04-lamp.json
docker build -t="$1604-lamp:php7.2-nightly" .
