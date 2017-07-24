#! /usr/bin/env bash
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F438280EF8D349F
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
apt-get install -y vim puppet
apt-get autoclean -y
apt-get autoremove -y
mkdir -p /etc/puppetlabs/code/hiera
echo "---
:backends:
  - yaml
:yaml:
  :datadir: /etc/puppetlabs/code/hiera
:hierarchy:
  - common /etc/puppetlabs/code/hiera.yaml
" > /etc/puppetlabs/code/hiera.yaml

echo "---
drupal_php::opcache: 'none'
drupal_php::server::apache::server_default_vhost: false

apache::vhost::manage_docroot: false
apache::default_vhost: false
apache::default_confd_files: false
" > /etc/puppetlabs/code/hiera/common.yaml
