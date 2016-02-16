#! /usr/bin/env bash
apt-get update
apt-get install -y vim puppet
mkdir -p /etc/puppet/hiera
echo "---
:backends:
  - yaml
:yaml:
  :datadir: /etc/puppet/hiera
:hierarchy:
  - common /etc/puppet/hiera.yaml
" > /etc/puppet/hiera.yaml

echo "---
drupal_php::opcache: 'none'
drupal_php::server::apache::server_default_vhost: false

apache::vhost::manage_docroot: false
apache::default_vhost: false
apache::default_confd_files: false
" > /etc/puppet/hiera/common.yaml
