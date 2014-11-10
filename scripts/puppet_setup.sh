#! /usr/bin/env bash
# Fix an Ubuntu bug that warns anytime stdin is not a tty.
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
# Don't use the us mirrors, they sometimes cause trouble.
sed -i 's/\/us\./\//g' /etc/apt/sources.list
# Update our package list, especially since we changed the sources.
sudo apt-get update -y
# Install puppet.
sudo apt-get install puppet -y
# Create an empty hierra.yaml so puppet doesn't complain when it is not there.
echo '' > /etc/puppet/hiera.yaml
