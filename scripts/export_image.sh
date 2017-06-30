#! /bin/bash

rm -f /vagrant/ubuntu-14.04-lamp-nightly.tar
docker save proboci/ubuntu-14.04-lamp:nightly > /vagrant/ubuntu-14.04-lamp-nightly.tar
