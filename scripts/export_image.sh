#! /bin/bash

rm -f /vagrant/workspace/*
docker save proboci/ubuntu-14.04-lamp:php5.6-nightly > /vagrant/workspace/ubuntu-14.04-php5.6-nightly.tar
docker save proboci/ubuntu-14.04-lamp:php7.0-nightly > /vagrant/workspace/ubuntu-14.04-php7.0-nightly.tar
docker save proboci/ubuntu-14.04-lamp:php7.1-nightly > /vagrant/workspace/ubuntu-14.04-php7.1-nightly.tar
docker save proboci/ubuntu-16.04-lamp:php7.0-nightly > /vagrant/workspace/ubuntu-16.04-php7.0-nightly.tar
docker save proboci/ubuntu-16.04-lamp:php7.1-nightly > /vagrant/workspace/ubuntu-16.04-php7.1-nightly.tar
docker save proboci/ubuntu-16.04-lamp:php7.2-nightly > /vagrant/workspace/ubuntu-16.04-php7.1-nightly.tar
