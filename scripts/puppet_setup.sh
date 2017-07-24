#! /usr/bin/env bash
# Fix an Ubuntu bug that warns anytime stdin is not a tty.
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
# Don't use the us mirrors, they sometimes cause trouble.
sed -i 's/\/us\./\//g' /etc/apt/sources.list
# Update our package list, especially since we changed the sources.
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F438280EF8D349F
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
# Install puppet.
DEBIAN_FRONTEND=noninteractive apt-get install vim puppet -y
# Create an empty hierra.yaml so puppet doesn't complain when it is not there.
mkdir -p /etc/puppetlabs/puppet
mkdir -p /etc/puppet
echo '' > /etc/puppetlabs/puppet/hiera.yaml
echo '' > /etc/puppet/hiera.yaml
