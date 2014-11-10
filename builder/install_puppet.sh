#! /usr/bin/env bash
apt-get update
apt-get install -y vim puppet
touch /etc/puppet/hiera.yaml

# Should we use the official puppetlabs repo?
# apt-get install -y wget
# wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
# dpkg -i puppetlabs-release-precise.deb
