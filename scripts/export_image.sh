#! /bin/bash

rm -f /vagrant/workspace/ubuntu-14.04-lamp-nightly.tar
docker save proboci/ubuntu-14.04-lamp:nightly > /vagrant/workspace/ubuntu-14.04-lamp-nightly.tar
