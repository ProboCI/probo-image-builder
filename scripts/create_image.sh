#! /bin/bash

cd /vagrant/builder
/usr/local/bin/packer build ubuntu-14.04-lamp.json
docker build -t="proboci/ubuntu-14.04-lamp:nightly" .
