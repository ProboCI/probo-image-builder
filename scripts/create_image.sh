#! /bin/bash

cd /vagrant/builder/14.04-php5.6
/usr/local/bin/packer build ubuntu-14.04-lamp.json
docker build -t="proboci/ubuntu-14.04-lamp:php5.6-nightly" .

cd ../14.04-php7.0
/usr/local/bin/packer build ubuntu-14.04-lamp.json
docker build -t="proboci/ubuntu-14.04-lamp:php7.0-nightly" .

cd ../14.04-php7.1
/usr/local/bin/packer build ubuntu-14.04-lamp.json
docker build -t="proboci/ubuntu-14.04-lamp:php7.1-nightly" .

cd ../16.04-php7.0
/usr/local/bin/packer build ubuntu-16.04-lamp.json
docker build -t="proboci/ubuntu-16.04-lamp:php7.0-nightly" .

cd ../16.04-php7.1
/usr/local/bin/packer build ubuntu-16.04-lamp.json
docker build -t="proboci/ubuntu-16.04-lamp:php7.1-nightly" .

cd ../16.04-php7.2
/usr/local/bin/packer build ubuntu-16.04-lamp.json
docker build -t="proboci/ubuntu-16.04-lamp:php7.2-nightly" .
