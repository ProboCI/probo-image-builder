#! /usr/bin/env bash
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
DEBIAN_FRONTEND=noninteractive apt-get install software-properties-common python-software-properties -y
DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:ansible/ansible -y
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install ansible -y
apt-get autoclean -y
apt-get autoremove -y
